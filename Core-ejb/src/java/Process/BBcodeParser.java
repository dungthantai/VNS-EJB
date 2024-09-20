/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Process;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Administrator
 */
public class BBcodeParser {

    private String html;
    private Map<String, String> bbMap = new HashMap<String, String>();

    public String getHtml() {
        return html;
    }

    public void setHtml(String html) {
        this.html = html;
    }

    public BBcodeParser() {
        
        bbMap.put("(\r\n|\r|\n|\n\r)", "<br/>");
        bbMap.put("(\r\n|\r|\n|\n\r)", "<br/>");
        bbMap.put("\\[b\\](.+?)\\[/b\\]", "\\<b>$1</b>");
        bbMap.put("\\[i\\](.+?)\\[/i\\]", "<i>$1</i>");
        bbMap.put("\\[u\\](.+?)\\[/u\\]", "<u>$1</u>");
        bbMap.put("\\[h1\\](.+?)\\[/h1\\]", "<h1>$1</h1>");
        bbMap.put("\\[h2\\](.+?)\\[/h2\\]", "<h2>$1</h2>");
        bbMap.put("\\[h3\\](.+?)\\[/h3\\]", "<h3>$1</h3>");
        bbMap.put("\\[h4\\](.+?)\\[/h4\\]", "<h4>$1</h4>");
        bbMap.put("\\[h5\\](.+?)\\[/h5\\]", "<h5>$1</h5>");
        bbMap.put("\\[h6\\](.+?)\\[/h6\\]", "<h6>$1</h6>");
        bbMap.put("\\[quote user=\"(.+?)\" post=\"(.+?)\"\\](.+?)\\[/quote\\]", "<div class=\"bbode_quote\"><div>Trích:</div><table><tbody><tr><td><div>Nguyên văn bởi <strong>$1</strong><a href=\"/forum/post/$2\"><img alt=\"View Post\" src=\"/forum/images/quoteicon.gif\" title=\"View Post\"></a></div><div style=\"font-style:italic;\">$3</div></td></tr></tbody></table></div>");
        bbMap.put("\\[quote user=\"(.+?)\"\\](.+?)\\[/quote\\]", "<div class=\"bbode_quote\"><div>Trích:</div><table><tbody><tr><td><div>Nguyên văn bởi <strong>$1</strong></div><div style=\"font-style:italic;\">$2</div></td></tr></tbody></table></div>");
        bbMap.put("\\[quote\\](.+?)\\[/quote\\]", "<div class=\"bbode_quote\"><div>Trích:</div><table><tbody><tr><td><div style=\"font-style:italic;\">$1</div></td></tr></tbody></table></div>");
        bbMap.put("\\[p\\](.+?)\\[/p\\]", "<p>$1</p>");
        bbMap.put("\\[p=(.+?),(.+?)\\](.+?)\\[/p\\]", "<p style='text-indent:$1px;line-height:$2%;'>$3</p>");
        bbMap.put("\\[center\\](.+?)\\[/center\\]", "<div align='center'>$1");
        bbMap.put("\\[align=(.+?)\\](.+?)\\[/align\\]", "<div align='$1'>$2");
        bbMap.put("\\[color=(.+?)\\](.+?)\\[/color\\]", "<span style='color:$1;'>$2</span>");
        bbMap.put("\\[size=(.+?)\\](.+?)\\[/size\\]", "<span style='font-size:$1;'>$2</span>");
        bbMap.put("\\[img\\](.+?)\\[/img\\]", "<img src='$1' />");
        bbMap.put("\\[img=(.+?),(.+?)\\](.+?)\\[/img\\]", "<img width='$1' height='$2' src='$3' />");
        bbMap.put("\\[email\\](.+?)\\[/email\\]", "<a href='mailto:$1'>$1</a>");
        bbMap.put("\\[email=(.+?)\\](.+?)\\[/email\\]", "<a href='mailto:$1'>$2</a>");
        bbMap.put("\\[url\\](.+?)\\[/url\\]", "<a href='$1'>$1</a>");
        bbMap.put("\\[url=(.+?)\\](.+?)\\[/url\\]", "<a href='$1'>$2</a>");
        bbMap.put("\\[youtube\\](.+?)\\[/youtube\\]", "<object width='640' height='380'><param name='movie' value='http://www.youtube.com/v/$1'></param><embed src='http://www.youtube.com/v/$1' type='application/x-shockwave-flash' width='640' height='380'></embed></object>");
        bbMap.put("\\[video\\](.+?)\\[/video\\]", "<video src='$1' />");
    }

    public String convert(String html) {
        html = html.replace("<", "&lt;").replace(">", "&gt;");
        for (Map.Entry entry : bbMap.entrySet()) {
            html = html.replaceAll(entry.getKey().toString(), entry.getValue().toString());
        }
        this.html = html;
        return html;
    }

}
