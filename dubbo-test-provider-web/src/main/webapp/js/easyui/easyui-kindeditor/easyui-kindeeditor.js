(function ($, K) {
      if (!K)
          throw "KindEditor未定义!";
      var editor; //定义 kindeditor  对象
      function create(target) {
          var opts = $.data(target, 'kindeditor').options;
          window.editor = K.create(target, opts);  // 把他给窗口对象 将他作用域放大
          $.data(target, 'kindeditor').options.editor = editor;
      }
 
     $.fn.kindeditor = function (options, param) {
         if (typeof options == 'string') {
             var method = $.fn.kindeditor.methods[options];
             if (method) {
                 return method(this, param);
            }
         }
         options = options || {};
         return this.each(function () {
            var state = $.data(this, 'kindeditor');
             if (state) {
                $.extend(state.options, options);
             } else {
                 state = $.data(this, 'kindeditor', {
                         options : $.extend({}, $.fn.kindeditor.defaults, $.fn.kindeditor.parseOptions(this), options)
                     });
             }
            create(this);
         });
     }
 
     $.fn.kindeditor.parseOptions = function (target) {
         return $.extend({}, $.parser.parseOptions(target, []));
     };
 
     $.fn.kindeditor.methods = {
         editor : function (jq) {
             return $.data(jq[0], 'kindeditor').options.editor;
        }
     };
 
     $.fn.kindeditor.defaults = {   // 设置   默认  出来的属性就在这儿  
         resizeType : 1,
         uploadJson : 'kindeditor-4.1.10/jsp/upload_json.jsp',  
         fileManagerJson : 'kindeditor-4.1.10/jsp/file_manager_json.jsp',
         allowPreviewEmoticons : true,
        allowImageUpload : true,
         items : [
                  'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                  'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                  'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                  'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                  'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                  'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                  'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                  'anchor', 'link', 'unlink', '|', 'about'
          ],
         afterChange:function(){
             this.sync();
        }
    };
     $.parser.plugins.push("kindeditor");
 })(jQuery, KindEditor);