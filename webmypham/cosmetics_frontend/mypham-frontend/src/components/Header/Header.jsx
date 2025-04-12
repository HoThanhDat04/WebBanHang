import React from "react";
import { Link } from "react-router-dom";
import { ShoppingCart, User, UserPlus, LogOut } from "lucide-react";
import "./Header.css";

const Header = ({ isLoggedIn, onLogout }) => {
  return (
    <header className="header">
      {/* Bên trái: Logo */}
      <div className="logo">
        <Link to="/">SoHOT</Link>
      </div>

      {/* Giữa: ô tìm kiếm */}
      <div className="search">
        <input type="text" placeholder="Tìm kiếm sản phẩm..." />
      </div>

      {/* Menu */}
      <nav className="menu">
        <Link to="/">Trang chủ</Link>
        <Link to="/categories">Danh mục</Link> {/* ✅ Thêm mục này */}
        <Link to="/products">Sản phẩm</Link>
        <Link to="/tin-tuc">Tin tức</Link>
      </nav>

      {/* Bên phải: login, register, cart */}
      <div className="actions">
        {isLoggedIn ? (
          <>
            <button onClick={onLogout}>
              <LogOut /> Đăng xuất
            </button>
            <Link to="/cart">
              <ShoppingCart />
            </Link>
          </>
        ) : (
          <>
            <Link to="/token">
              <User /> Đăng nhập
            </Link>
            <Link to="/register">
              <UserPlus /> Đăng ký
            </Link>
            <Link to="/cart">
              <ShoppingCart />
            </Link>
          </>
        )}
      </div>
    </header>
  );
};

export default Header;
