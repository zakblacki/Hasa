(()=>{function t(e){return t="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},t(e)}function e(t,e){return function(t){if(Array.isArray(t))return t}(t)||function(t,e){var n=null==t?null:"undefined"!=typeof Symbol&&t[Symbol.iterator]||t["@@iterator"];if(null!=n){var r,a,i,o,l=[],s=!0,u=!1;try{if(i=(n=n.call(t)).next,0===e){if(Object(n)!==n)return;s=!1}else for(;!(s=(r=i.call(n)).done)&&(l.push(r.value),l.length!==e);s=!0);}catch(t){u=!0,a=t}finally{try{if(!s&&null!=n.return&&(o=n.return(),Object(o)!==o))return}finally{if(u)throw a}}return l}}(t,e)||function(t,e){if(!t)return;if("string"==typeof t)return n(t,e);var r=Object.prototype.toString.call(t).slice(8,-1);"Object"===r&&t.constructor&&(r=t.constructor.name);if("Map"===r||"Set"===r)return Array.from(t);if("Arguments"===r||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(r))return n(t,e)}(t,e)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function n(t,e){(null==e||e>t.length)&&(e=t.length);for(var n=0,r=new Array(e);n<e;n++)r[n]=t[n];return r}function r(t,e){for(var n=0;n<e.length;n++){var r=e[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(t,a(r.key),r)}}function a(e){var n=function(e,n){if("object"!=t(e)||!e)return e;var r=e[Symbol.toPrimitive];if(void 0!==r){var a=r.call(e,n||"default");if("object"!=t(a))return a;throw new TypeError("@@toPrimitive must return a primitive value.")}return("string"===n?String:Number)(e)}(e,"string");return"symbol"==t(n)?n:String(n)}var i=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}var n,a,i;return n=t,(a=[{key:"init",value:function(){var t=function(t){for(var n=JSON.parse(t.dataset.list),r=[],a=0,i=Object.entries(n);a<i.length;a++){var o=e(i[a],2),l=o[0],s=o[1];r.push({value:l,name:s})}var u=String(t.value).split(","),c=r.filter((function(t){if(u.includes(String(t.value)))return{value:t.id,name:t.name}}));new Tagify(t,{tagTextProp:"name",enforceWhitelist:!0,skipInvalid:!0,dropdown:{closeOnSelect:!1,enabled:0,classname:"users-list",searchKeys:["value","name"]},templates:{tag:function(t){return'\n                <tag title="'.concat(t.title||t.name,"\"\n                        contenteditable='false'\n                        spellcheck='false'\n                        tabIndex=\"-1\"\n                        class=\"").concat(this.settings.classNames.tag," ").concat(t.class?t.class:"",'"\n                        ').concat(this.getAttributes(t),">\n                    <x title='' class='tagify__tag__removeBtn' role='button' aria-label='remove tag'></x>\n                    <div class=\"d-flex align-items-center\">\n                        <span class='tagify__tag-text'>").concat(t.name,"</span>\n                    </div>\n                </tag>\n            ")},dropdownItem:function(t){return"\n                <div ".concat(this.getAttributes(t),'\n                    class="tagify__dropdown__item d-flex align-items-center ').concat(t.class?t.class:"",'"\n                    tabindex="0"\n                    role="option">\n\n                    <div class="d-flex flex-column">\n                        <strong>').concat(t.name,"</strong>\n                    </div>\n                </div>\n            ")}},whitelist:r,originalInputValueFormat:function(t){return t.map((function(t){return t.value})).join(",")}}).loadOriginalValues(c)};$(document).find(".tags").each((function(e,n){if($(n).data("url")){var r=new Tagify(n,{keepInvalidTags:void 0===$(n).data("keep-invalid-tags")||$(n).data("keep-invalid-tags"),enforceWhitelist:void 0!==$(n).data("enforce-whitelist")&&$(n).data("enforce-whitelist"),delimiters:void 0!==$(n).data("delimiters")?$(n).data("delimiters"):",",whitelist:n.value.trim().split(/\s*,\s*/),userInput:void 0===$(n).data("user-input")||$(n).data("user-input")});r.on("input",(function(t){r.settings.whitelist.length=0,r.loading(!0).dropdown.hide.call(r),$httpClient.make().get($(n).data("url")).then((function(e){var n=e.data;r.settings.whitelist=n,r.loading(!1).dropdown.show.call(r,t.detail.value)}))}))}else n.dataset.list&&t(n)})),document.querySelectorAll(".list-tagify").forEach((function(e){e.dataset.list&&t(e)}))}}])&&r(n.prototype,a),i&&r(n,i),Object.defineProperty(n,"prototype",{writable:!1}),t}();$((function(){(new i).init()}))})();