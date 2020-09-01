const editDisplay = () => {
  // Ingredients Display:
  const editForm = document.querySelector(".form-recipe-edit");
  if (editForm) {
  const ingValue = editForm.querySelector('textarea[name="recipe[ingredients]"]');

    const ingData = ingValue.value;
    console.log(ingData[0]);
    const ingArray = ingData.substring(1, ingData.length - 1).replaceAll('"', "").split(",");
    let ingTrimed = [];
    ingArray.forEach((ing) => {
      ingTrimed.push(ing.trim());
    });

    document.querySelector('textarea[name="recipe[ingredients]"]').value = ingTrimed.join("\r\n");

  // Instruciton Display:
    const instValue = document.querySelector('textarea[name="recipe[instructions]"]');

    const instData = instValue.value;
    const instArray = instData.substring(1, instData.length - 1).replaceAll('"', "").split(",");

    let instTrimed = [];
    instArray.forEach((inst) => {
      instTrimed.push(inst.trim());
    });

    document.querySelector('textarea[name="recipe[instructions]"]').value = instTrimed.join("\r\n");
  }
}

export { editDisplay };


// edit_display.js: 3 null
// edit_display.js: 3 < textarea class=​"form-control is-valid text required" name = "recipe[ingredients]​" id = "recipe_ingredients" >​…​</textarea >
//   let a = document.getElementById("cc");
// undefined
// a.value
// VM2474: 1 Uncaught TypeError: Cannot read property 'value' of null
// at<anonymous>: 1: 3
//   (anonymous) @VM2474: 1
// a
// null
// let a = document.querySelector("input[name="recipe[ingredients]"]");
// VM2774: 1 Uncaught SyntaxError: missing ) after argument list
// let a = document.querySelector('input[name="recipe[ingredients]"]');
// undefined
// a
// null
// let a = document.querySelectorAll('input');
// undefined
// a
// NodeList(10)[input, input, input#recipe_title.form - control.is - valid.string.required, input#recipe_serving.form - control.is - valid.string.required, input#recipe_preptime.form - control.is - valid.numeric.integer.required, input#recipe_photo.form - control - file.is - valid.file.optional, input, input#recipe_displayed_yes.form - check - input.radio_buttons.optional, input#recipe_displayed_no_keep_private.form - check - input.radio_buttons.optional, input.btn.btn - warning]0: input1: input2: input#recipe_title.form - control.is - valid.string.required3: input#recipe_serving.form - control.is - valid.string.required4: input#recipe_preptime.form - control.is - valid.numeric.integer.required5: input#recipe_photo.form - control - file.is - valid.file.optional6: inputaccept: ""accessKey: ""align: ""alt: ""ariaAtomic: nullariaAutoComplete: nullariaBusy: nullariaChecked: nullariaColCount: nullariaColIndex: nullariaColSpan: nullariaCurrent: nullariaDescription: nullariaDisabled: nullariaExpanded: nullariaHasPopup: nullariaHidden: nullariaKeyShortcuts: nullariaLabel: nullariaLevel: nullariaLive: nullariaModal: nullariaMultiLine: nullariaMultiSelectable: nullariaOrientation: nullariaPlaceholder: nullariaPosInSet: nullariaPressed: nullariaReadOnly: nullariaRelevant: nullariaRequired: nullariaRoleDescription: nullariaRowCount: nullariaRowIndex: nullariaRowSpan: nullariaSelected: nullariaSetSize: nullariaSort: nullariaValueMax: nullariaValueMin: nullariaValueNow: nullariaValueText: nullassignedSlot: nullattributeStyleMap: StylePropertyMap { size: 0 } attributes: NamedNodeMap { 0: type, 1: name, 2: value, type: type, name: name, value: value, length: 3 } autocapitalize: ""autocomplete: ""autofocus: falsebaseURI: "http://localhost:3000/recipes/30/edit"checked: falsechildElementCount: 0childNodes: NodeList[]children: HTMLCollection[]classList: DOMTokenList[value: ""]className: ""clientHeight: 0clientLeft: 0clientTop: 0clientWidth: 0contentEditable: "inherit"dataset: DOMStringMap { } defaultChecked: falsedefaultValue: ""dir: ""dirName: ""disabled: falsedraggable: falseelementTiming: ""enterKeyHint: ""files: nullfirstChild: nullfirstElementChild: nullform: form#edit_recipe_30.simple_form.edit_recipeformAction: "http://localhost:3000/recipes/30/edit"formEnctype: ""formMethod: ""formNoValidate: falseformTarget: ""height: 0hidden: falseid: ""incremental: falseindeterminate: falseinnerHTML: ""innerText: ""inputMode: ""isConnected: trueisContentEditable: falselabels: nulllang: ""lastChild: nulllastElementChild: nulllist: nulllocalName: "input"max: ""maxLength: -1min: ""minLength: -1multiple: falsename: "recipe[displayed]"namespaceURI: "http://www.w3.org/1999/xhtml"nextElementSibling: div.form - checknextSibling: div.form - checknodeName: "INPUT"nodeType: 1nodeValue: nullnonce: ""offsetHeight: 0offsetLeft: 0offsetParent: nulloffsetTop: 0offsetWidth: 0onabort: nullonanimationend: nullonanimationiteration: nullonanimationstart: nullonauxclick: nullonbeforecopy: nullonbeforecut: nullonbeforepaste: nullonbeforexrselect: nullonblur: nulloncancel: nulloncanplay: nulloncanplaythrough: nullonchange: nullonclick: nullonclose: nulloncontextmenu: nulloncopy: nulloncuechange: nulloncut: nullondblclick: nullondrag: nullondragend: nullondragenter: nullondragleave: nullondragover: nullondragstart: nullondrop: nullondurationchange: nullonemptied: nullonended: nullonerror: nullonfocus: nullonformdata: nullonfullscreenchange: nullonfullscreenerror: nullongotpointercapture: nulloninput: nulloninvalid: nullonkeydown: nullonkeypress: nullonkeyup: nullonload: nullonloadeddata: nullonloadedmetadata: nullonloadstart: nullonlostpointercapture: nullonmousedown: nullonmouseenter: nullonmouseleave: nullonmousemove: nullonmouseout: nullonmouseover: nullonmouseup: nullonmousewheel: nullonpaste: nullonpause: nullonplay: nullonplaying: nullonpointercancel: nullonpointerdown: nullonpointerenter: nullonpointerleave: nullonpointermove: nullonpointerout: nullonpointerover: nullonpointerrawupdate: nullonpointerup: nullonprogress: nullonratechange: nullonreset: nullonresize: nullonscroll: nullonsearch: nullonseeked: nullonseeking: nullonselect: nullonselectionchange: nullonselectstart: nullonstalled: nullonsubmit: nullonsuspend: nullontimeupdate: nullontoggle: nullontransitionend: nullonvolumechange: nullonwaiting: nullonwebkitanimationend: nullonwebkitanimationiteration: nullonwebkitanimationstart: nullonwebkitfullscreenchange: nullonwebkitfullscreenerror: nullonwebkittransitionend: nullonwheel: nullouterHTML: "<input type="hidden" name="recipe[displayed]" value="">"outerText: ""ownerDocument: documentparentElement: fieldset.form - group.radio_buttons.optional.recipe_displayedparentNode: fieldset.form - group.radio_buttons.optional.recipe_displayedpart: DOMTokenList[value: ""]pattern: ""placeholder: ""prefix: nullpreviousElementSibling: legend.col - form - label.pt - 0previousSibling: legend.col - form - label.pt - 0readOnly: falserequired: falsescrollHeight: 0scrollLeft: 0scrollTop: 0scrollWidth: 0selectionDirection: nullselectionEnd: nullselectionStart: nullshadowRoot: nullsize: 20slot: ""spellcheck: truesrc: ""step: ""style: CSSStyleDeclaration { alignContent: "", alignItems: "", alignSelf: "", alignmentBaseline: "", all: "", … } tabIndex: 0tagName: "INPUT"textContent: ""title: ""translate: truetype: "hidden"useMap: ""validationMessage: ""validity: ValidityState { valueMissing: false, typeMismatch: false, patternMismatch: false, tooLong: false, tooShort: false, … } value: ""valueAsDate: nullvalueAsNumber: NaNwebkitEntries: []webkitdirectory: falsewidth: 0willValidate: false__proto__: HTMLInputElement(...)7: input#recipe_displayed_yes.form - check - input.radio_buttons.optional8: input#recipe_displayed_no_keep_private.form - check - input.radio_buttons.optional9: input.btn.btn - warninglength: 10__proto__: NodeList
// let a = document.querySelector('textarea[name="recipe[ingredients]"]');
// undefined
// a
//   < textarea class=​"form-control is-valid text required" name = "recipe[ingredients]​" id = "recipe_ingredients" >​#shadow - root(user - agent)"["bell pepper", "eggs", "lime "]"</textarea >
//     a.value
// "["bell pepper", "eggs", "lime "]"
// typeof (a.value)
// "string"
// a.value.splice(1, a.value.length - 2);
// VM3716: 1 Uncaught TypeError: a.value.splice is not a function
//   at<anonymous>: 1: 9
//     (anonymous) @VM3716: 1
// let c = a.value
// undefined
// c.substring(1);
// ""bell pepper", "eggs", "lime "]"
// c.substring(1, c.length - 2);
// ""bell pepper", "eggs", "lime "
// c.substring(1, c.length - 1);
// ""bell pepper", "eggs", "lime ""
// let d = c.substring(1, c.length - 1);
// undefined
// d
// ""bell pepper", "eggs", "lime ""
// d.split(",");
// (3)[""bell pepper"", " "eggs"", " "lime ""]
// d
// ""bell pepper", "eggs", "lime ""
// d.replace('"', "");
// "bell pepper", "eggs", "lime ""
// d.replaceAll('"', "");
// "bell pepper, eggs, lime "
// d
// ""bell pepper", "eggs", "lime ""
// d.replaceAll(' ', "_");
// ""bell_pepper",_"eggs",_"lime_""
// d.replaceAll(' ', "_").split(",");
// (3)[""bell_pepper"", "_"eggs"", "_"lime_""]
// d
// ""bell pepper", "eggs", "lime ""
// d.split(",");
// (3)[""bell pepper"", " "eggs"", " "lime ""]
// d.replaceAll('"', "");
// "bell pepper, eggs, lime "
// d.replaceAll('"', "").split;
// ƒ split() { [native code] }
// d.replaceAll('"', "").split(",");
// (3)["bell pepper", " eggs", " lime "]
// d.replaceAll('"', "").split(",");
// (3)["bell pepper", " eggs", " lime "]
// d.replaceAll('"', "").split(",")[1].trim;
// ƒ trim() { [native code] }
// d.replaceAll('"', "").split(",")[1].trim();
// "eggs"
// let e = d.replaceAll('"', "").split(",");
// undefined
// e
//   (3)["bell pepper", " eggs", " lime "]
// e.forEach(x => x.trim());
// undefined
// e.forEach(x => console.log(x.trim()));
// VM4568: 1 bell pepper
// VM4568: 1 eggs
// VM4568: 1 lime
// undefined
// a.value
// "["bell pepper", "eggs", "lime "]"
// a.value = "test"
// "test"
