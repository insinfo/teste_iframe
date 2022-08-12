import 'package:angular/angular.dart';
import 'package:teste_iframe/src/js/workarouds.dart';
import 'dart:html' as html;
import 'package:js/js_util.dart' as js_util;

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [],
)
class AppComponent {
  @ViewChild('iframeForPrint')
  html.IFrameElement iframeForPrint;

  void imprimir() {
    //
    // html.Window win = iframeForPrint.contentWindow;
    var contentWindow = js_util.getProperty(iframeForPrint, 'contentWindow');

    html.Document document = js_util.getProperty(contentWindow, 'document');
    document.querySelector('body').innerHtml = '<h1>test</h1>';
    print(document.querySelector('body').innerHtml);
  }
}
