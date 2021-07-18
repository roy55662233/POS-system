package com.pos.chicken.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pos.chicken.domain.ProdBean;

@Service
@Transactional(value="transactionManager")
public class ProdServiceRepository {

	@Autowired
	private ProdRepository prodao;
	
	public List<ProdBean> select(ProdBean bean) {
		
		List<ProdBean> result = null;
		if(bean!=null && bean.getProdID()!=null) {
		 Optional<ProdBean> optional = prodao.findById(bean.getProdID());
		 if(!optional.isEmpty()) {
			 ProdBean temp = optional.get();
			 result = new ArrayList<ProdBean>();
			 result.add(temp);
		 }
		 
		}else {
			 result= prodao.findAll();
		 }
		return result;
	}
	
	public ProdBean insert(Integer prodID, String prodName, String prodUnit, String prodCategory, Integer prodPrice, Integer prodCount, MultipartFile prodImg) {
		try {
			ProdBean result = null;
			ProdBean bean = new ProdBean();
			bean.setProdID(prodID);
			bean.setProdName(prodName);
			bean.setProdPrice(prodPrice);
			bean.setProdUnit(prodUnit);
			bean.setProdCategory(prodCategory);
			bean.setProdCount(prodCount);
			byte[] newprodImg= prodImg.getBytes();
//			bean.setProdImg(newprodImg);
		
			if(bean!=null && bean.getProdID()!=null) {
				if(!prodao.existsById(bean.getProdID())) {
					result=prodao.save(bean);
			}else {
				result=prodao.save(bean);
			}
				return result;
		}
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public Integer selectCount(Integer prodID) {
		return prodao.findById(prodID).get().getProdCount();
	}
	
	
}
