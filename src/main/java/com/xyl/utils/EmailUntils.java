package com.xyl.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class EmailUntils {

	private static final String hostName = "smtp.qq.com";
    private static final String userInfo = "vxqwhzhxraowfjed"; //服务器验证码 -- 非发件人邮箱密码
    
    private static final String chartset = "UTF-8";
    //发件人
    private static final String senderEmail = "1528474876@qq.com";
    //发件人昵称
    private static final String senderNick = "遇您识货";
    //主题
    private static final String emailSubject = "来自“遇您识货”的通知";
    
    
    
    public boolean addCustByAdmin(Map map) {
    	try {
            HtmlEmail email = new HtmlEmail();
            // 配置信息
            email.setHostName(hostName);
            email.setFrom(senderEmail,senderNick);
            email.setAuthentication(senderEmail,userInfo);
            email.setCharset(chartset);
            email.setSubject(emailSubject);
            String sendHtml = "尊敬的客户您好！<hr>“遇您识货”后台已为您注册为："+map.get("sort")+"用户，初始密码为：xnsh123456";
            email.setHtmlMsg(sendHtml);
            // 收件人
            if (null != map.get("custEmail")) {
               email.addTo((String)map.get("custEmail"));
            }
            //发送
            try {
				email.send();
				return true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
            
        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        } 
    }
    /**
     * 申请鉴定通知
     * */
    public boolean noticeCustAppr(String receive ,String code) {
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml = "尊敬的客户您好！<hr>您的鉴定申请码为"+code;
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null !=receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
    /**
     * 鉴定结果通知
     * */
    public boolean appraisalWare(String receive ,String code,String isReadlly) {
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml="";
    		if(isReadlly.equals("readlly")) {
    			 sendHtml = "尊敬的客户您好！<hr>恭喜您！您鉴定码为"+code+"的商品，鉴定结果为真品！";
    		}else {
    			sendHtml = "尊敬的客户您好！<hr>抱歉！您鉴定码为"+code+"的商品，鉴定结果为非真品！";
    		}
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null !=receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
    
    /**
     * 会员到期
     * 
     * */
    public boolean expireOrder(String[] receive) {
    	try {
            HtmlEmail email = new HtmlEmail();
            // 配置信息
            email.setHostName(hostName);
            email.setFrom(senderEmail,senderNick);
            email.setAuthentication(senderEmail,userInfo);
            email.setCharset(chartset);
            email.setSubject(emailSubject);
            String sendHtml = "尊敬的客户您好！<hr>您在“遇您识货”的会员已到期，感谢您的支持！";
            email.setHtmlMsg(sendHtml);
            // 收件人
            if (null != receive) {
               email.addTo(receive);
            }
            //发送
            try {
				email.send();
				return true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
            
        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        } 
    }
    /**
     * 客户下单消费
     * 消费多少
     * 消费方式
     * 余额多少
     * */
    public boolean addOrder(String receive, String way,Float price,Float balance) {
    	Date date = new Date();
    	SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    	String time = dateFormat.format(date);
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml = "尊敬的客户您好！<hr>您的账户在  "+time+" 通过 <span style='color:blue;'>"+way+"</span> 的方式，消费了 <span style='color:red;'>"+price+"</span> 积分，当前余额为：<span style='color:orange;'>"+balance+"</span>";
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null != receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
    /**
     * 邮件发送工具类(单个)
     * 
     * */
    public static boolean sendEmail(String receive ,String code) {
        try {
            HtmlEmail email = new HtmlEmail();
            // 配置信息
            email.setHostName(hostName);
            email.setFrom(senderEmail,senderNick);
            email.setAuthentication(senderEmail,userInfo);
            email.setCharset(chartset);
            email.setSubject(emailSubject);
            String sendHtml = "尊敬的客户您好！<hr>【遇您识货】激活码为：<span style='color:blue;'>"+code+"</span>，本激活码的有效时间为5分钟，请勿告知他人！";
            email.setHtmlMsg(sendHtml);
            // 收件人
            if (null != receive) {
               email.addTo(receive);
            }
            //发送
            try {
				email.send();
				return true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
            
        } catch (EmailException e) {
            e.printStackTrace();
            return false;
        } 
    }
   
    
    /**
     * 反驳和同意通用的邮件（客户）
     * */
    public boolean sendEmailsRollBack(String receive ,String isOwe,Map map,Float nowMoney) {
    	Long object = (Long) map.get("createTime");
    	String rechargeSort = (String) map.get("rechargeSort");
    	Integer rechargeMoney = (Integer) map.get("rechargeMoney");
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//这个是你要转成后的时间的格式
    	String sd = sdf.format(new Date(object)); 
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml = null;
    		if(isOwe.equals("true")) {
    			sendHtml = "尊敬的客户您好！<hr>您的账户在<span style='color:blue;'>"+sd+"</span>，"+rechargeSort+""+rechargeMoney+"元失败！<br>并且由于您的消费使得当前积分<span style='color:blue;'>"+nowMoney+"</span>！请您尽快充值！";
    		}else{
    			sendHtml = "尊敬的客户您好！<hr>抱歉！您的账户出现异常在<span style='color:blue;'>"+sd+"</span>，"+rechargeSort+""+rechargeMoney+"元失败！<br>";
    		}
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null != receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
    /**
     * 提现失败和成功
     * */
    public boolean cashSuccessOrFail(String receive ,String isSuccess,Map map) {
    	Long object = (Long) map.get("createTime");
    	Integer rechargeMoney = (Integer) map.get("cashMoney");
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//这个是你要转成后的时间的格式
    	String sd = sdf.format(new Date(object)); 
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml = null;
    		if(isSuccess.equals("success")) {
    			sendHtml = "尊敬的客户您好！<hr>您的账户在<span style='color:blue;'>"+sd+"</span>提现"+rechargeMoney+"元成功！请注意查收<br>！";
    		}else{
    			sendHtml = "尊敬的客户您好！<hr>抱歉！由于您的账户或提现账号出现异常在<span style='color:blue;'>"+sd+"</span>提现"+rechargeMoney+"元失败！<br>";
    		}
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null != receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
    
    /**
     * 邮件发送工具类(批量)
     * @param receive 接收者的数组 
     *  @param state 接收者的数组
     * @param isSuccess	是否通过 只有传success才通过
     * */
    public static boolean sendEmails(String[] receive ,String isSuccess) {
    	try {
    		HtmlEmail email = new HtmlEmail();
    		// 配置信息
    		email.setHostName(hostName);
    		email.setFrom(senderEmail,senderNick);
    		email.setAuthentication(senderEmail,userInfo);
    		email.setCharset(chartset);
    		email.setSubject(emailSubject);
    		String sendHtml = null;
    		if(isSuccess.equals("success")) {
    			sendHtml = "尊敬的客户您好！<hr>您的账户已经<span style='color:blue;'>通过审核</span>！您可以凭借真实姓名或邮箱登录进行鉴定啦！";
    		}else{
    			sendHtml = "尊敬的客户您好！<hr>抱歉！您的账户<span style='color:blue;'>未通过审核</span>！<br>请您重新申请或添加客服<span style='color:orange;'>QQ：123456789</span>了解详细申请规则！";
    		}
    		email.setHtmlMsg(sendHtml);
    		// 收件人
    		if (null != receive) {
    			email.addTo(receive);
    		}
    		//发送
    		try {
    			email.send();
    			return true;
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    			return false;
    		}
    		
    	} catch (EmailException e) {
    		e.printStackTrace();
    		return false;
    	} 
    }
}

