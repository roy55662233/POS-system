package com.pos.chicken.controller;

import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pos.chicken.domain.EmpBean;
import com.pos.chicken.domain.OrderBean;
import com.pos.chicken.domain.OrderDetailBean;
import com.pos.chicken.domain.ProdBean;
import com.pos.chicken.repository.OrderDetailRepository;
import com.pos.chicken.repository.OrderDetailServiceRepository;
import com.pos.chicken.repository.OrderRepository;
import com.pos.chicken.repository.ProdRepository;
import com.pos.chicken.repository.ProdServiceRepository;

@Controller
@Transactional
public class ShopcarController {

	@Autowired
	private OrderRepository orderService;

	@Autowired
	private ProdServiceRepository prodService;
	
    @Autowired
    private JavaMailSender emailSender;
    
	@Autowired
	private ProdRepository prodDao;

	@Autowired
	private OrderDetailRepository orderDdao;

	@Autowired
	private OrderDetailServiceRepository orderDetailServiceRepository;
	
	@RequestMapping(path = "/secure/shopcar.controller")
	public String shopcar(
			String orderInsert, // 從前端sumbit name="orderInsert"
			Integer[] prodID, // 前端ID
			String[] prodName,// 從前端產品名稱 name=prodName
			Integer[] prodCount, // 前端產品數量
			Model model,
			ProdBean prodBean,
			OrderDetailBean odBean,
			BindingResult bindingResult,
			OrderBean orderbean,
			String mailname
			) throws MessagingException {
		
		
		if (orderInsert != null && orderInsert.equals("Insert")) {
			int i=0;
			for(Integer prodInt : prodID) {
				 i++;
				prodBean.setProdID(prodInt); 
				prodBean.setProdCount(prodDao.getById(prodInt).getProdCount()-prodCount[i-1]);
				prodBean.setProdName(prodDao.getById(prodInt).getProdName()); 
				prodBean.setProdPrice(prodDao.getById(prodInt).getProdPrice());
				prodBean.setProdCategory(prodDao.getById(prodInt).getProdCategory());
				prodBean.setProdUnit(prodDao.getById(prodInt).getProdUnit());
				prodDao.save(prodBean);
				
			}
			
			//員工
			EmpBean empbean = new EmpBean();
			empbean.setEmpID("Emp001");
			
			//訂單主表
			orderbean.setEmpfk(empbean);
			orderbean.setOrderDate(new Date());
			orderbean.setOrderMark("我是備註");
			orderService.save(orderbean);
			model.addAttribute("test", orderbean);
			int k=0;
			String str = "";
			for(Integer prodInt : prodID) {
				k++;
				//訂單明細odBean
				odBean.setOrderId( orderbean.getOrderId() );	
				odBean.setOrderCount(prodCount[k-1]);
				odBean.setOrderUnitsprice( prodDao.getById(prodInt).getProdPrice() );
				odBean.setOrderPrice( prodCount[k-1]*prodDao.getById(prodInt).getProdPrice() ); 
				odBean.setProdfk( prodDao.getById(prodInt) );	

				orderDdao.addOrderToDetail(orderbean.getOrderId(),
				prodDao.getById(prodInt).getProdID(), prodCount[k-1], 
				prodCount[k-1]*prodDao.getById(prodInt).getProdPrice(),
				prodDao.getById(prodInt).getProdPrice());
				
				System.out.println(orderbean.getOrderId());
				System.out.println(prodDao.getById(prodInt).getProdName());
				System.out.println(prodCount[k-1]);
				System.out.println(prodDao.getById(prodInt).getProdPrice());
				//字串累加，format參數
				str+=String.format(
		  		  		      
		  		  		  "    <tr><td style=' border: 1px solid black; height: 75px; text-align:center;'>"+orderbean.getOrderId()+"</td>\r\n"
		  		  		+ "        <td style=' border: 1px solid black; height: 75px; text-align:center;'> %s </td>\r\n"
		  		  		+ "        <td style=' border: 1px solid black; height: 75px; text-align:center;'> %d </td>\r\n"
		  		  		+ "        <td style=' border: 1px solid black; height: 75px; text-align:center;'> %d </td>\r\n"
		  		  		+ "    </tr>"
		  		  		, prodDao.getById(prodInt).getProdName(),prodCount[k-1],(prodDao.getById(prodInt).getProdPrice()*prodCount[k-1]));
				//表格開頭+身體內容(str)
				String fixed="<html><body><table style='border-collapse: collapse;border: 1px solid black;'>\r\n"
						+ "    <tr style=' border: 1px solid black; text-align:center;'>\r\n"
						+ "        <td style=' border: 1px solid black;' colspan='4'>\r\n"
						+ "            <img style='border-radius: 87px;' src='https://i.ibb.co/ccC66TZ/Logo.jpg' alt='Logo'>\r\n"
						+ "            <h2 style='text-align:center; font-weight:bold;'>POS雞大專戰隊</h2>\r\n"
						+ "        </td>\r\n"
					    + "   </tr> "
						
		  		  		 
		  		  		+ "    <tr style=' border: 1px solid black;'>\r\n"
		  		  		+ "        <th style=' border: 1px solid black; background-color:pink; width: 200px; height: 100px;'>訂單號碼 </th>\r\n"
		  		  		+ "        <th style=' border: 1px solid black; background-color:pink; width: 200px; height: 100px;'>產品名稱 </th>\r\n"
		  		  		+ "        <th style=' border: 1px solid black; background-color:pink; width: 200px; height: 100px;'>訂單數量 </th>\r\n"
		  		  		+ "        <th style=' border: 1px solid black; background-color:pink; width: 200px; height: 100px;'>訂單金額 </th>\r\n"
		  		  		+ "    </tr>"
		  		  		+str
		  		  		+ "</table></body></html>"
		  		  		;
				//當"K變數"等於產品長度時才寄信
				if(k==prodID.length) {
					//如果沒填email也可以進行MVC
					if(mailname!="") {
					sendSimpleMessage(mailname,fixed);
					}	
				};
			}
			
			Object[] odfindall = orderDdao.findByOrderAll(odBean.getOrderId()).toArray();
			model.addAttribute("test2", odfindall);
			
//			印出總金額
			Object totalprice =orderDetailServiceRepository.orderPrice(odBean.getOrderId());
			model.addAttribute("test4", totalprice);
//			印出總數量
			Object ordercoint =orderDetailServiceRepository.ordercoint(odBean.getOrderId());
			model.addAttribute("test5", ordercoint);
		}
		return "/font-pages/shop/order";
	}


	public void sendSimpleMessage(String to, String text ) throws MessagingException {
			MimeMessage mimeMessage = emailSender.createMimeMessage(); 
	  		MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage,"utf-8");
	  		messageHelper.setTo(to);
	  		messageHelper.setSubject("springboot透過 Gmail 去發信");
	  		messageHelper.setText(text, true);
	  		emailSender.send(messageHelper.getMimeMessage());
	  	    }

	
	@GetMapping("/oderdetail/{id}")
	public String findByPrimaryKey(@PathVariable("id") Integer id ,Model model) {
		OrderDetailBean bean1 = new OrderDetailBean();
		bean1.setOrderId(id);
		List<OrderDetailBean> a = orderDdao.selectOrderToDetail(id);
		model.addAttribute("select", a);
		return "/back-pages/shop/getOrderDetail";
	}
}

