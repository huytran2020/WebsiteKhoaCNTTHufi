using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class CongNgheDao
    {
        KhoaCNTT db = null;
        public CongNgheDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNewNoiDungCongNghe(int top)
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 5).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        public List<ConTentTinTuc> ListNoiDungCongNgheCu(int top)
        {
            return db.ConTentTinTucs.Where(x => x.TopHot != null && x.TopHot < DateTime.Now && x.CategoryID == 5).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
    }
}