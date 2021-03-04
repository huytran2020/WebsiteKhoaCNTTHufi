using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class XemThemNoiDungGioiThieuDao
    {
        KhoaCNTT db = null;
        public XemThemNoiDungGioiThieuDao()
        {
            db = new KhoaCNTT();
        }
        public List<ConTentTinTuc> ListNoiDungGioiThieu()
        {
            return db.ConTentTinTucs.Where(x => x.CategoryID == 4).ToList();
        }
    }
}