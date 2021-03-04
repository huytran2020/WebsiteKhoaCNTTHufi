using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class XemThemNoiDungDaoTinTuc
    {
        KhoaCNTT db = null;
        public XemThemNoiDungDaoTinTuc()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNoiDungTinTuc()
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 3).ToList();
        }
    }
}