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
                MessageBox.Show(ex.Message, "Erreur!");
            }

            return listeCours;
        }

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

        public int ModifierCours(TblCour cours) 
        {
            int nombreLignesAffectees = 0;
            try
            {
                using (var context = new Glg_bdContext()) 
                {   
                    var coursRechercher = context.TblCours.Find(cours.NoCours);

                    MessageBox.Show(context.Entry(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *UNCHANGED*

                    coursRechercher.NoCours = cours.NoCours;
                    coursRechercher.Nom = cours.Nom;
                    coursRechercher.Pond = cours.Pond;

                    MessageBox.Show(context.Entry(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *MODIFIED*

                    nombreLignesAffectees = context.SaveChanges(); 
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return nombreLignesAffectees;           
        }


        public int DetruireCours(TblCour cours)
        {
            int nombreLignesAffectees = 0;
            try
            {
                using (var context = new Glg_bdContext())
                {
                    var coursRechercher = context.TblCours.Find(cours.NoCours);

                    MessageBox.Show(context.Remove(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *UNCHANGED*

                    coursRechercher.NoCours = cours.NoCours;
                    coursRechercher.Nom = cours.Nom;
                    coursRechercher.Pond = cours.Pond;

                    MessageBox.Show(context.Remove(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *MODIFIED*

                    nombreLignesAffectees = context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return nombreLignesAffectees;
        }
    }
}
