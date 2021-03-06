/*global $,cyberDojo*/

var cyberDojo = (function(cd, $) {
  "use strict";

  cd.dialog_cantFindDojo = function(id) {
    var cantFindDojo = 
      '<div class="panel">'
      + '<table>'
      +    '<tr>'
      +      '<td>'
      +        "I can't find a cyber-dojo with that id.<br/>"
      +        '<br/>'
      +        'A full id is always 10 characters long, '
      +        'contains only the digits 0123456789 '
      +        'and letters ABCDEF, and is case insensitive.<br/>'
      +        '<br/>'
      +        'You usually only need to enter the '
      +        'first 5 characters of an id.'
      +        '<br/>'
      +        'Click <div id="setup" class="button">setup</div> to get a new id<br/>'      
      +      '</td>'
      +    '</tr>'
      +  '</table>'
      + '</div>';
    var width, title;
    return cd.dialog(cantFindDojo, width = 400, title = '? ' + id + ' ?');
  };

  return cd;
})(cyberDojo || {}, $);
