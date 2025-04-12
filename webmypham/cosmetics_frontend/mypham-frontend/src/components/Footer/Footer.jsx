// src/components/Footer/Footer.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import './Footer.css';

const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer-container">
        <div className="footer-col">
          <h4>THÔNG TIN LIÊN HỆ</h4>
          <p>Hotline: 1900-633-xxxx (8:00-21:00)<br />
             • Hợp tác kinh doanh bán hàng<br />
             • shop@thegioiskinfood.com<br />
             • marketing@thegioiskinfood.com<br />
             • Tuyển dụng: tuyendung@thegioiskinfood.com
          </p>
        </div>

        <div className="footer-col">
          <h4>DANH MỤC</h4>
          <ul>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/hang-noi-bat">Hàng nổi bật</Link></li>
            <li><Link to="/giam-gia">Giảm giá</Link></li>
            <li><Link to="/trang-diem">Trang điểm</Link></li>
            <li><Link to="/tin-tuc">Tin tức</Link></li>
          </ul>
        </div>

        <div className="footer-col">
          <h4>VỀ CHÚNG TÔI</h4>
          <ul>
            <li><Link to="/ve-chung-toi">Sứ mệnh</Link></li>
            <li><Link to="/thanh-toan">Phương thức thanh toán</Link></li>
            <li><Link to="/doi-tra">Chính sách đổi trả</Link></li>
            <li><Link to="/bao-mat">Chính sách bảo mật</Link></li>
          </ul>
        </div>

        <div className="footer-col">
          <h4>KẾT NỐI VỚI CHÚNG TÔI</h4>
          <div className="footer-subscribe">
            <input type="email" placeholder="Email" />
            <button>Gửi</button>
          </div>
          <div className="icon-container">
  <img src="./icons/fb.png" alt="Facebook" />
  <img src="./icons/ig.png" alt="Instagram" />
  <img src="./icons/yt.png" alt="YouTube" />
</div>

        </div>
      </div>
    </footer>
  );
};

export default Footer;