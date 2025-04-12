import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import axiosInstance from "../axiosConfig";
import "./productDetailPage.css";
const BASE_URL = 'http://localhost:8000';

const ProductDetailPage = () => {
  const { id } = useParams(); // cách này cũng đúng nếu context đảm bảo
  const [product, setProduct] = useState(null);
  const [selectedVariant, setSelectedVariant] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    console.log("ID sản phẩm:", id);  // để kiểm tra có đúng id không
    fetchProduct();
  }, [id]);
  

  const fetchProduct = async () => {
    try {
      const res = await axiosInstance.get(`products/${id}/`);
      setProduct(res.data);
      if (res.data.variants.length > 0) {
        setSelectedVariant(res.data.variants[0]); // chọn biến thể đầu tiên mặc định
      }
    } catch (err) {
      console.error("Lỗi tải chi tiết sản phẩm:", err);
    } finally {
      setLoading(false);
    }
  };

  const handleVariantChange = (variantId) => {
    const variant = product.variants.find(v => v.id === parseInt(variantId));
    setSelectedVariant(variant);
  };

  const handleAddToCart = async () => {
    try {
      // lấy giỏ hàng
      const cartRes = await axiosInstance.get("cart/");
      let cartId;

      if (cartRes.data.length === 0) {
        const newCart = await axiosInstance.post("cart/", {});
        cartId = newCart.data.id;
      } else {
        cartId = cartRes.data[0].id;
      }

      // thêm sản phẩm
      await axiosInstance.post("cart-items/", {
        cart: cartId,
        variant: selectedVariant.id,
        quantity: 1,
      });

      alert("Đã thêm sản phẩm vào giỏ hàng!");
    } catch (err) {
      console.error("Lỗi thêm vào giỏ:", err.response?.data || err.message);
      alert("Không thể thêm sản phẩm. Vui lòng thử lại.");
    }
  };

  if (loading) return <p>Đang tải sản phẩm...</p>;
  if (!product) return <p>Không tìm thấy sản phẩm.</p>;

  const price = product.price + (selectedVariant?.additional_price || 0);

  return (
    <div className="product-detail-container">
      <div className="image-section">
        <img 
          src={product.images?.[0]?.image_url
             ? `${BASE_URL}/media/${product.images[0].image_url}`
      : "/images/default-product.jpg"
          }
          alt={product.name}
          className="main-image"
        />
      </div>

      <div className="info-section">
        <h2>{product.name}</h2>
        <p className="price">{price.toLocaleString()} đ</p>
        <p className="description">{product.description}</p>

        {product.variants.length > 0 && (
          <div className="variant-select">
            <label>Chọn biến thể:</label>
            <select onChange={(e) => handleVariantChange(e.target.value)} value={selectedVariant?.id}>
              {product.variants.map(variant => (
                <option key={variant.id} value={variant.id}>
                  {variant.color || "Màu"} - {variant.size || "Size"} (+{variant.additional_price}đ)
                </option>
              ))}
            </select>
          </div>
        )}

        <button className="add-to-cart-btn" onClick={handleAddToCart}>
          Thêm vào giỏ hàng
        </button>
      </div>
    </div>
  );
};

export default ProductDetailPage;
