using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechnoService2.DBStorage
{
    public static class DBStorage
    {
        public static TechnoEntities DB_s { get; set; } = new TechnoEntities();
    }
}
