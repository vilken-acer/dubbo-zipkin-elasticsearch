  
package com.test.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.pojo.User;
import com.test.service.RpcManager;

import kafka.producer.KeyedMessage;
import kafka.producer.Producer;
import scala.collection.Seq;




@Controller
public class UserController {

	@Resource
	private RpcManager rpcManager;
	
	/*@Resource
	private Producer<String, String> producer;*/
	
	@RequestMapping(value="getUserListPage")
	public String getUserList(){
		return "welcom";
	}
	
	/*private final Producer<String, String> producer;  
    public final static String TOPIC = "mytopic";  
  
    private UserController() {  
        Properties props = new Properties();  
        // 此处配置的是kafka的端口  
        props.put("metadata.broker.list", "127.0.0.1:9092");  
        props.put("zookeeper.connect", "127.0.0.1:2181");    
  
        // 配置value的序列化类  
        props.put("serializer.class", "kafka.serializer.StringEncoder");  
        // 配置key的序列化类  
        props.put("key.serializer.class", "kafka.serializer.StringEncoder");  
  
        props.put("request.required.acks", "-1");  
  
        producer = new Producer<String, String>(new ProducerConfig(props));  
    }*/  
	
	
	@RequestMapping(value="selectUserList")
	//@ResponseBody
	public String selectUserList(User user){
		rpcManager.invoke(user);
		
		//producer.send((Seq) new KeyedMessage<String, String>("userlistdata",userlist));
		//producer.send((Seq<KeyedMessage<String, String>>) new KeyedMessage<String, String>(TOPIC, "selectUserList", userlist));
		return "";  
	}
	
	
}
