import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import axiosInstance from '../axiosConfig';
import './CategoryPage.css';

const CategoryPage = () => {
  const [categories, setCategories] = useState([]);

  useEffect(() => {
    axiosInstance.get('categories/')
      .then(res => setCategories(res.data))
      .catch(err => console.error('Lỗi lấy danh mục:', err));
  }, []);

  return (
    <div className="category-page">
      <h1>Danh mục sản phẩm</h1>
      <div className="category-list">
        {categories.map(category => (
          <div className="category-card" key={category.id}>
            <Link to={`/products?category=${category.id}`}>
              <img
                src={category.image || 'https://via.placeholder.com/250x150.png?text=Category'}
                alt={category.name}
                className="category-image"
              />
              <span className="category-name">{category.name}</span>
            </Link>
          </div>
        ))}
      </div>
    </div>
  );
};

export default CategoryPage;
