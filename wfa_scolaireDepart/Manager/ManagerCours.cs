using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using wfa_scolaireDepart.Models;
using wfa_scolaireDepart.Manager;
using System.Windows.Forms;
using System.Drawing.Imaging.Effects;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;

namespace wfa_scolaireDepart.Manager
{
    public class ManagerCours
    {

        public List<TblCour> ListerCoursEager()
        {
            List<TblCour> rep = new List<TblCour>();
            try
            {
                using (var context = new Glg_bdContext())
                {
                    rep =  context.TblCours.Include(c => c.TblOffreCours)
                             .OrderBy(c => c.Nom).ToList();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return rep;
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
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return listeCours;
        }

        public int AjouterCours(TblCour cours)
        {
            int nombreLignesAffectees = 0;
            try
            {
                using (var context = new Glg_bdContext())
                {
                    MessageBox.Show(context.Entry(cours).State.ToString());
                    context.TblCours.Add(cours);
                    MessageBox.Show(context.Entry(cours).State.ToString());
                    nombreLignesAffectees = context.SaveChanges();
                }
            }
            catch (DbUpdateException ex)
            {
                var errorMessage = "Erreur, corrigez puis réessayer. \n\r";
                if (ex.InnerException is SqlException sqlException)
                {
                    errorMessage += $" Error Number: {sqlException.Number}\n\r Message: {sqlException.Message}\n\r";
                }
                throw new Exception(errorMessage);
            }
            catch (Exception)
            {
                throw;
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

                    //MessageBox.Show(context.Entry(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *UNCHANGED*

                    coursRechercher.NoCours = cours.NoCours;
                    coursRechercher.Nom = cours.Nom;
                    coursRechercher.Pond = cours.Pond;

                    //MessageBox.Show(context.Entry(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *MODIFIED*

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

                    context.Remove(cours);

                    MessageBox.Show(context.Remove(coursRechercher).State.ToString()); //Pour afficher le State du courRechecher *REMOVED*

                    nombreLignesAffectees = context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return nombreLignesAffectees;
        }

        //////////////////////////////////////////////////////////////////////////////////////
        /// MODIFIER ET DÉTRUIRE AVEC ATTACH
        //////////////////////////////////////////////////////////////////////////////////////

        public int ModifierCoursAvecAttach(TblCour coursModifier, TblCour coursNonModifier)
        {
            int nombreLignesAffectees = 0;
            try
            {
                using (var context = new Glg_bdContext())
                {
                    MessageBox.Show(context.Entry(coursNonModifier).State.ToString()); //Pour afficher le State du coursNonModifier *DETACHED*

                    context.TblCours.Attach(coursNonModifier);

                    MessageBox.Show(context.Entry(coursNonModifier).State.ToString()); //Pour afficher le State du coursNonModifier *UNCHANGED*

                    coursNonModifier.NoCours = coursModifier.NoCours;
                    coursNonModifier.Nom = coursModifier.Nom;
                    coursNonModifier.Pond = coursModifier.Pond;

                    MessageBox.Show(context.Entry(coursNonModifier).State.ToString()); //Pour afficher le State du coursNonModifier *MODIFIED*

                    nombreLignesAffectees = context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return nombreLignesAffectees;
        }

        public int DetruireCoursAvecAttach(TblCour coursDetruit)
        {
            int nombreLignesAffectees = 0;
            try
            {
                using (var context = new Glg_bdContext())
                {
                    context.TblCours.Attach(coursDetruit);

                    MessageBox.Show(context.Remove(coursDetruit).State.ToString()); //Pour afficher le State du courRechecher *UNCHANGED*

                    coursDetruit.NoCours = coursDetruit.NoCours;
                    coursDetruit.Nom = coursDetruit.Nom;
                    coursDetruit.Pond = coursDetruit.Pond;

                    MessageBox.Show(context.Remove(coursDetruit).State.ToString()); //Pour afficher le State du courRechecher *MODIFIED*

                    nombreLignesAffectees = context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            return nombreLignesAffectees;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////
    }
}
