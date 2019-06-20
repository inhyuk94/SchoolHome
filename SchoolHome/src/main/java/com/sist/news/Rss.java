package com.sist.news;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/*
 *    OXM ==> Object XML Mapper ==> (태그 = 클래스) => JAXB
 *    <rss> =======================> Rss
 *      <channel> =================> Channel
 *        <item>  =================> Item 
 *          <title id="">aaa</title>         => String title
 *        </item>
 *        <item>
 *          <title></title>
 *        </item>
 *        <item>
 *          <title></title>
 *        </item>
 *     </channel>
 *    </rss>
 */
@XmlRootElement
public class Rss {
    private Channel channel=new Channel();

	public Channel getChannel() {
		return channel;
	}
	@XmlElement
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
   
}
