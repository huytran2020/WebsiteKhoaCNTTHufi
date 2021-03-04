using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class GioiThieuDao
    {
        KhoaCNTT db = null;
        public GioiThieuDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNewNoiDungGioiThieu(int top)
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 4).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        public List<ConTentTinTuc> ListNoiDungGioiThieuCu(int top)
        {
            return db.ConTentTinTucs.Where(x => x.TopHot != null && x.TopHot < DateTime.Now && x.CategoryID == 4).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
    }
}