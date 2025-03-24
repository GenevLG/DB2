using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wfa_scolaireDepart.Models;
using wfa_scolaireDepart.Manager;
using System.Windows.Forms;
using System.Drawing.Imaging.Effects;

namespace wfa_scolaireDepart.Manager
{
    internal class ManagerCours
    {
        public int AjouterCours(TblCour cours)
        {
            int nombreLignesAffectees = 0;
            using (var context = new Glg_bdContext())
            {
                MessageBox.Show(context.Entry(cours).State.ToString());
                context.TblCours.Add(cours);
                MessageBox.Show(context.Entry(cours).State.ToString());
                nombreLignesAffectees = context.SaveChanges();                 
            }
            return nombreLignesAffectees;
        }

        public List<TblCour> ListerCours() //Faire une liste pour remplir la comboBox (nomComboBox)
        {
            List<TblCour> listeCours = new List<TblCour>();
            try
            {
                using (var context = new Glg_bdContext())
                {
                    return context.TblCours.OrderBy(c => c.Nom).ToList();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            return listeCours;
        }
    }
}
