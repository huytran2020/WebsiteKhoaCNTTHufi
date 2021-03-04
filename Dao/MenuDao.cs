using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DoAnKhoaCNTT.Models.Database;
namespace DoAnKhoaCNTT.Dao
{
    public class MenuDao
    {
        KhoaCNTT db = null;
        public MenuDao()
        {
            db = new KhoaCNTT();
        }
        public List<Menu> LisByFroupId(int groupId)
        {
            return db.Menus.Where(x => x.TypeID == groupId && x.Status == true).ToList();
        }
    }
}