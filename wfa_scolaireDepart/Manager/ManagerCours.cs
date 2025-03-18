using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wfa_scolaireDepart.Models;
using wfa_scolaireDepart.Manager;
using System.Windows.Forms;

namespace wfa_scolaireDepart.Manager
{
    internal class ManagerCours
    {
        public int AjouterCours(TblCour cours)
        {
            int nombreLignesAffectees = 0;
            using (var context = new Glg_bdContext())
            {
                context.TblCours.Add(cours);
                nombreLignesAffectees=context.SaveChanges();                 
            }
        }
    }
}
