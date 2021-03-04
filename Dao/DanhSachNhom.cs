using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class DanhSachNhom
    {
        private KhoaCNTT db = null;
        public DanhSachNhom()
        {
            db = new KhoaCNTT();
        }
        public List<NhomSV> DanhSachNhomDaiHocDao()
        {
            return db.NhomSVs.Where(x => x.TenLoaiDeTai == "Đồ án").ToList();
        }
        public List<NhomSV> DanhSachNhomDaiHocKLDao()
        {
            return db.NhomSVs.Where(x => x.TenLoaiDeTai == "Khóa luận").ToList();
        }
    }
}