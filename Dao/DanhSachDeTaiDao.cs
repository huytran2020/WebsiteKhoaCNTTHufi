using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class DanhSachDeTaiDao
    {
        private KhoaCNTT db = null;
        public DanhSachDeTaiDao()
        {
            db = new KhoaCNTT();
        }
        public List<DeTai> ListDeTai()
        {
            return db.DeTais.Where(x => x.MaLoai == 1).ToList();
        }
        public List<DeTai> ListDeTaiKhoaLuan()
        {
            return db.DeTais.Where(x => x.MaLoai == 2).ToList();
        }
    }
}