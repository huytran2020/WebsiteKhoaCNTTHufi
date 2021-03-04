using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class XemThemNoiDungDaoTaoDao
    {
        KhoaCNTT db = null;
        public XemThemNoiDungDaoTaoDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNoiDungDaoTao()
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 2).ToList();
        }
    }
}