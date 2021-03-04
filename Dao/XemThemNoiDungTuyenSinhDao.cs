using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class XemThemNoiDungTuyenSinhDao
    {
        KhoaCNTT db = null;
        public XemThemNoiDungTuyenSinhDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNoiDungTuyenSinh()
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 1).ToList();
        }
    }
}