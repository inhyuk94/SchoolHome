package com.sist.news;

import org.springframework.stereotype.Service;
/*
 *     ������ ==> �󼼺��� (���) => Trigger
 *     ����� ==> webSocket => Index
 *     �ݿ��� ==> ������Ʈ ������ => Spring ������ 
 *     
 *     �� => React (webstorm)
 *     ȭ => Node => mongodb
 *     �� => Node <=> React (Router)
 *     �� => front => ������ ����Ʈ
 *     �� 
 *     �� =>
 *     ȭ => ���� => webpack 
 *     �� => ���� => ���� 
 */
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import java.net.*;
@Service
public class NewsManager {
    public List<Item> newsAllData(String data)
    {
    	List<Item> list=new ArrayList<Item>();
    	try
    	{
    		JAXBContext jc=JAXBContext.newInstance(Rss.class);
    		URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="
    				       +URLEncoder.encode(data, "UTF-8"));
    		Unmarshaller un=jc.createUnmarshaller();

    		Rss rss=(Rss)un.unmarshal(url);
    		list=rss.getChannel().getItem();
    	}catch(Exception ex){}
    	return list;
    }
}













