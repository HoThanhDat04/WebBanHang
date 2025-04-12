import React from 'react';
import ProductCard from '../ProductCard/ProductCard';
import './ProductSection.css';

const ProductSection = ({ title, products, onAddToCart }) => {
  return (
    <section className="product-section">
      <h2 className="section-title">{title}</h2>
      <div className="product-list">
        {Array.isArray(products) && products.length > 0 ? (
          products.map(product => (
            <ProductCard
              key={product.id}
              product={product}
              onAddToCart={onAddToCart} // Truyền onAddToCart xuống ProductCard
            />
          ))
        ) : (
          <p>Không có sản phẩm để hiển thị.</p>
        )}
      </div>
      <div className="see-more">
        <a href="/">Xem thêm sản phẩm →</a>
      </div>
    </section>
  );
};

export default ProductSection;