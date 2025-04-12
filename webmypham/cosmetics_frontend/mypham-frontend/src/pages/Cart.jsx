import React, { useEffect, useState } from "react";
import "./cart.css";
import axiosInstance from "../axiosConfig";
import { useNavigate } from "react-router-dom";

const CartPage = () => {
  const [cart, setCart] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    loadCart();
  }, []);

  const loadCart = async () => {
    try {
      const res = await axiosInstance.get("cart/"); 
      setCart(res.data?.[0] || null);
    } catch (err) {
      console.error("Lỗi khi tải giỏ hàng:", err);
      setError("Không thể tải giỏ hàng.");
    } finally {
      setLoading(false);
    }
  };

  const updateQuantity = async (itemId, newQty) => {
    if (newQty < 1) return;
    try {
      await axiosInstance.put(`cart-items/${itemId}/`, { quantity: newQty });
      loadCart();
    } catch (err) {
      alert("Không thể cập nhật số lượng.");
      console.error(err);
    }
  };

  const deleteItem = async (itemId) => {
    try {
      await axiosInstance.delete(`cart-items/${itemId}/`);
      loadCart();
    } catch (err) {
      alert("Không thể xóa sản phẩm.");
      console.error(err);
    }
  };

  const handleCheckout = async () => {
    try {
      const addressRes = await axiosInstance.get("addresses/");
      const defaultAddress = addressRes.data.find((addr) => addr.is_default);

      if (!defaultAddress) {
        alert("Vui lòng thêm địa chỉ giao hàng mặc định.");
        navigate("/addresses");
        return;
      }

      const totalAmount = cart.items.reduce((sum, item) => {
        const basePrice = Number(item.product?.price || 0);
        const additionalPrice = item.variant ? Number(item.variant.additional_price || 0) : 0;
        return sum + (basePrice + additionalPrice) * item.quantity;
      }, 0);

      const orderRes = await axiosInstance.post("orders/", {
        address: defaultAddress.id,
        total_amount: totalAmount,
        payment_method: "cash",
      });

      await axiosInstance.delete(`cart/${cart.id}/`); 
      alert(`Đặt hàng thành công! Mã đơn hàng: ${orderRes.data.id}`);
      navigate(`/orders/${orderRes.data.id}`);
    } catch (err) {
      alert("Không thể hoàn tất thanh toán.");
      console.error(err);
    }
  };

  if (loading) return <p>Đang tải giỏ hàng...</p>;
  if (error) return <p>{error}</p>;
  if (!cart || cart.items.length === 0) return <p>Giỏ hàng của bạn đang trống.</p>;

  const total = cart.items.reduce((sum, item) => {
    const basePrice = Number(item.product?.price || 0);
    const additionalPrice = item.variant ? Number(item.variant.additional_price || 0) : 0;
    return sum + (basePrice + additionalPrice) * item.quantity;
  }, 0);

  return (
    <div className="cart-container">
      <h2>Giỏ hàng của bạn</h2>
      <ul>
        {cart.items.map((item) => (
          <li key={item.id} className="cart-item">
            <div className="item-info">
              <img
                src={
                  item.product?.images?.[0]?.image_url
                    ? `http://127.0.0.1:8000/media/${item.product.images[0].image_url}`
                    : "/images/default-product.jpg"
                }
                alt={item.product?.name}
                style={{ width: 50, height: 50, objectFit: "cover", marginRight: 10 }}
              />
              <div>
                <p>{item.product?.name || "Sản phẩm không xác định"}</p>
                {item.variant?.color && <p>Màu: {item.variant.color}</p>}
                {item.variant?.size && <p>Kích cỡ: {item.variant.size}</p>}
                <p>
                  Giá:{" "}
                  {(Number(item.product?.price || 0) + (item.variant ? Number(item.variant.additional_price || 0) : 0)).toLocaleString()}đ
                </p>
              </div>
            </div>
            <div className="item-actions">
              <div className="quantity-control">
                <button
                  onClick={() => updateQuantity(item.id, item.quantity - 1)}
                  disabled={item.quantity <= 1}
                >
                  -
                </button>
                <span>{item.quantity}</span>
                <button onClick={() => updateQuantity(item.id, item.quantity + 1)}>+</button>
              </div>
              <button onClick={() => deleteItem(item.id)} className="delete-btn">Xóa</button>
            </div>
          </li>
        ))}
      </ul>
      <div className="cart-summary">
        <h3>Tổng tiền: {total.toLocaleString()}đ</h3>
        <button className="checkout-btn" onClick={handleCheckout}>
          Thanh toán khi nhận hàng
        </button>
      </div>
    </div>
  );
};

export default CartPage;