using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class TinTucDao
    {
        KhoaCNTT db = null;
        public TinTucDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNewNoiDungTinTuc(int top)
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 3).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        public List<ConTentTinTuc> ListNoiDungTinTucCu(int top)
        {
            return db.ConTentTinTucs.Where(x => x.TopHot != null && x.TopHot < DateTime.Now && x.CategoryID == 3).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
    }
}