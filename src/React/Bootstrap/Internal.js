"use strict";

// module React.Bootstrap.Internal

// pretty raw stuff, but it's all there for convenience and type safety
// hope it doesn't affect performance too much
// the instanceof checks are bit tricky, they require appropriate definitions
// to be generated, it affects PS definition, see Button.purs, definition of
// button_ which cannot be made pointfree because it then would try to evaluate
// convertButtonProps without certain definitions being yet avaliable (PS["React.Bootstrap.Button"].Button for example)

function unwrapMaybe(res, props, k) {
  var Just = PS["Data.Maybe"].Just;
  var Nothing = PS["Data.Maybe"].Nothing;

  if(props[k] instanceof Just)
    return res[k] = props[k].value0;
  else if(!(props[k] instanceof Nothing))
    return res[k] = props[k];
}

function bootstrapSize(prop) {
  var m = PS["React.Bootstrap.Props"];
  var c;

  if((c = m.Large) && prop instanceof c)
    return "lg";
  if((c = m.Medium) && prop instanceof c)
    return "md";
  if((c = m.Small) && prop instanceof c)
    return "sm";
  if((c = m.XSmall) && prop instanceof c)
    return "xs";

  console.error("Unknown size: " + prop);
}

function bootstrapStyle(prop) {
  var m = PS["React.Bootstrap.Props"];
  var c;

  if((c = m.Default) && prop instanceof c)
    return "default";
  if((c = m.Primary) && prop instanceof c)
    return "primary";
  if((c = m.Success) && prop instanceof c)
    return "success";
  if((c = m.Info) && prop instanceof c)
    return "info";
  if((c = m.Warning) && prop instanceof c)
    return "warning";
  if((c = m.Danger) && prop instanceof c)
    return "danger";
  if((c = m.Link) && prop instanceof c)
    return "link";
  if((c = m.Inline) && prop instanceof c)
    return "inline";
  if((c = m.Tabs) && prop instanceof c)
    return "tabs";
  if((c = m.Pills) && prop instanceof c)
    return "pills";

  console.error("Unknown style: " + prop);
}

function commonProp(props, k) {
  if(k == "bsSize")
    return props[k] = bootstrapSize(props[k]);
  else if(k == "bsStyle")
    return props[k] = bootstrapStyle(props[k]);
}


function convertProps(f) {
  return function(props) {
    var res = {};

    for(var k in props) {
        if(!unwrapMaybe(res, props, k))
          continue;
        if(commonProp(res, k))
          continue;

        if(f) f(res, k);
    }

    return res;
  }
}

exports.convertProps = convertProps();

exports.convertButtonProps = convertProps(function (res, k) {
  function buttonType(prop) {
    var m = PS["React.Bootstrap.Button"];
    var c;

    if((c = m.Button) && prop instanceof c)
      return "button";
    if((c = m.Submit) && prop instanceof c)
      return "submit";
    if((c = m.Reset) && prop instanceof c)
      return "reset";

    console.error("Unknown button type: " + prop);
  }

  if(k == "type")
    res[k] = buttonType(res[k]);
});
