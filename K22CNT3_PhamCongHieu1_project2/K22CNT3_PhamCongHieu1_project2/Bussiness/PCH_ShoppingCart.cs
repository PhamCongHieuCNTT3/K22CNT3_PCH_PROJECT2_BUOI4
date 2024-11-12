using K22CNT3_PhamCongHieu1_project2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace K22CNT3_PhamCongHieu1_project2.Bussiness
{
    public class PCH_ShoppingCart
    {
        public List<PCH_CartItem> Items { get; set; }

        public PCH_ShoppingCart()
        {
            Items = new List<PCH_CartItem>();
        }

        // Chuc nang them san pham vao gio hang
        public void AddToCart(PCH_CartItem item)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == item.ID);
            if (existingItem != null)
            {
                existingItem.SoLuongMua += item.SoLuongMua;
            }
            else
            {
                Items.Add(item);
            }
        }

        // Xóa sản phẩm trong giỏ hàng
        public void RemoveCartItem(int id)
        {
            var itemToRemove = Items.FirstOrDefault(x => x.ID == id);
            if (itemToRemove != null)
            {
                Items.Remove(itemToRemove);
            }
        }

        // Tính tổng trị giá của hóa đơn
        public float GetTongThanhTien()
        {
            return Items.Sum(x => x.SoLuongMua * x.DonGiaMua);
        }

        // Cập nhật Shopping cart
        public void UpdateFromCart(int id, int qty)
        {
            var existingItem = Items.FirstOrDefault(x => x.ID == id);
            if (existingItem != null)
            {
                existingItem.SoLuongMua = qty;
            }
        }
    }
}
