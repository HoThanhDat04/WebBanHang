import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import './ProductCard.css';

const BASE_URL = 'http://localhost:8000';

const ProductCard = ({ product, onAddToCart }) => {
  const imageUrl = product.images?.[0]?.image_url
    ? `${BASE_URL}/media/${product.images[0].image_url}`
    : '/images/default-product.jpg';

  const [isAdding, setIsAdding] = useState(false);
  const [selectedVariant, setSelectedVariant] = useState(
    product.variants?.[0]?.id || null
  );

  const formatPrice = (price) => {
    return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(price);
  };

  const handleAddToCart = async () => {
    setIsAdding(true);
    try {
      await onAddToCart(product.id, selectedVariant);
    } catch (error) {
      console.error('Lỗi khi thêm vào giỏ hàng:', error);
      alert('Không thể thêm sản phẩm vào giỏ hàng.');
    } finally {
      setIsAdding(false);
    }
  };

  return (
    <div className="product-card">
      <div className="product-img">
        <img
          src={imageUrl}
          alt={product.name}
          onError={(e) => (e.target.src = '/images/default-product.jpg')}
        />
      </div>
      <div className="product-info">
        <h3 className="product-name">{product.name}</h3>
        <p className="product-price">{formatPrice(product.price || 0)}</p>

        {product.variants && product.variants.length > 0 ? (
          <div className="product-variants">
            <label>Chọn biến thể:</label>
            <select
              value={selectedVariant || ''}
              onChange={(e) => setSelectedVariant(e.target.value)}
            >
              <option value="" disabled>
                Chọn biến thể
              </option>
              {product.variants.map((variant) => (
                <option key={variant.id} value={variant.id}>
                  {variant.color} - {variant.size} (+{formatPrice(variant.additional_price)})
                </option>
              ))}
            </select>
          </div>
        ) : (
          <p>Không có biến thể</p>
        )}

        <div className="product-actions">
          <Link to={`/products/${product.id}`}>
            <button className="btn-detail">Chi tiết</button>
          </Link>
          <button
            className="btn-buy"
            onClick={handleAddToCart}
            disabled={isAdding}
          >
            {isAdding ? 'Đang thêm...' : 'Mua hàng'}
          </button>
        </div>
      </div>
    </div>
  );
};

export default ProductCard;