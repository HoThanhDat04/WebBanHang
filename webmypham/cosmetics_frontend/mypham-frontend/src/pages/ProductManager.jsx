import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axiosInstance from '../axiosConfig';
import "./productManager.css"; // nếu bạn dùng css riêng

const ProductManager = () => {
  const [products, setProducts] = useState([]);
  const [formData, setFormData] = useState({ name: '', price: '' });
  const [editId, setEditId] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = () => {
    axiosInstance.get('products/')
      .then(res => setProducts(res.data))
      .catch(err => console.error('Lỗi khi tải sản phẩm:', err));
  };

  const handleChange = e => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = e => {
    e.preventDefault();
    if (editId) {
      axiosInstance.put(`products/${editId}/`, formData)
        .then(() => {
          fetchProducts();
          setEditId(null);
          setFormData({ name: '', price: '' });
        });
    } else {
      axiosInstance.post('products/', formData)
        .then(() => {
          fetchProducts();
          setFormData({ name: '', price: '' });
        });
    }
  };

  const handleEdit = (product) => {
    setEditId(product.id);
    setFormData({ name: product.name, price: product.price });
  };

  const handleDelete = (id) => {
    if (window.confirm('Bạn chắc chắn muốn xóa sản phẩm này?')) {
      axiosInstance.delete(`products/${id}/`)
        .then(() => fetchProducts());
    }
  };

  // Thêm hàm điều hướng đến trang chi tiết sản phẩm
  const handleViewDetail = (id) => {
    navigate(`/products/${id}`);
  };

  return (
    <div className="product-manager">
      <h2>Sản phẩm</h2>
      
      <div className="add-product-form">
        <h3>Thêm mới</h3>
        <form onSubmit={handleSubmit}>
          <div className="form-row">
            <input
              name="name"
              placeholder="Tên sản phẩm"
              value={formData.name}
              onChange={handleChange}
              required
            />
            <input
              name="price"
              placeholder="Giá"
              value={formData.price}
              onChange={handleChange}
              required
            />
            <button type="submit">{editId ? 'Cập nhật' : 'Thêm'}</button>
          </div>
        </form>
      </div>
  
      <ul className="product-list">
        {products.map(product => (
          <li key={product.id} className="product-item">
            <div className="product-info">
              <span className="product-name">{product.name}</span>
              <span className="product-price">- {product.price}đ</span>
            </div>
            <div className="action-buttons">
              <button 
                className="action-btn edit-btn" 
                onClick={() => handleEdit(product)}
              >
                Sửa
              </button>
              <button 
                className="action-btn delete-btn" 
                onClick={() => handleDelete(product.id)}
              >
                Xóa
              </button>
              <button 
                className="action-btn detail-btn" 
                onClick={() => handleViewDetail(product.id)}
              >
                Chi tiết
              </button>
            </div>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductManager;
