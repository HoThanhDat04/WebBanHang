import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import "./login.css";

const LoginPage = ({ onLogin }) => {
  const [formData, setFormData] = useState({
    username: "",
    password: "",
  });
  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const response = await axios.post("http://127.0.0.1:8000/api/token/", formData);
      console.log("Đăng nhập thành công:", response.data);

      // Lưu token vào localStorage
      localStorage.setItem("access_token", response.data.access);
      localStorage.setItem("refresh_token", response.data.refresh);

      // Gọi hàm onLogin để cập nhật trạng thái đăng nhập
      if (onLogin) {
        onLogin();
      }

      alert("Đăng nhập thành công!");

      // Chuyển hướng đến trang chủ
      navigate("/");
    } catch (error) {
      console.error("Lỗi khi đăng nhập:", error.response?.data || error.message);
      alert("Đăng nhập thất bại!");
    }
  };

  return (
    <div className="login-wrapper">
      <div className="login-container">
        <h1>Đăng nhập</h1>
        <form onSubmit={handleSubmit} className="login-form">
          <label htmlFor="username">Tên người dùng hoặc địa chỉ Email</label>
          <input
            type="text"
            id="username"
            name="username"
            placeholder="Nhập tên đăng nhập hoặc Email..."
            value={formData.username}
            onChange={handleChange}
          />

          <label htmlFor="password">Mật khẩu</label>
          <input
            type="password"
            id="password"
            name="password"
            placeholder="Nhập mật khẩu..."
            value={formData.password}
            onChange={handleChange}
          />

          <button type="submit" className="btn-login">Đăng Nhập</button>
        </form>
      </div>
    </div>
  );
};

export default LoginPage;
