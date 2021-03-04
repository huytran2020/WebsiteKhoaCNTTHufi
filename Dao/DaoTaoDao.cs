using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class DaoTaoDao
    {
        KhoaCNTT db = null;
        public DaoTaoDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNewNoiDungDaoTao(int top)
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 2).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
        public List<ConTentTinTuc> ListNoiDungDaoTaoCu(int top)
        {
            return db.ConTentTinTucs.Where(x => x.TopHot != null && x.TopHot < DateTime.Now && x.CategoryID == 2).OrderByDescending(x => x.ModifiedDay).Take(top).ToList();
        }
    }
}