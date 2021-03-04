using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class DanhSachSinhVienDao
    {
        private KhoaCNTT db = null;
        public DanhSachSinhVienDao()
        {
            db = new KhoaCNTT();
        }
        public List<SinhVien> ListSinhVienDoAn()
        {
            return db.SinhViens.Where(x => x.Mark >= 2 && x.Mark < 2.5).ToList();
        }
        public List<SinhVien> ListSinhVienKhoaLuan()
        {
            return db.SinhViens.Where(x => x.Mark >= 2.5).ToList();
        }
    }
}