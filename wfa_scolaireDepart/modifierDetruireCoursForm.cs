using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using wfa_scolaireDepart.Manager;
using wfa_scolaireDepart.Models;

namespace wfa_scolaireDepart
{
    public partial class modifierDetruireCoursForm : Form
    {
        public modifierDetruireCoursForm()
        {
            InitializeComponent();
        }

        private void RemplirComboBox()
        {
            ManagerCours managerCours = new ManagerCours();
            try
            {
                nomCoursComboBox.DataSource = managerCours.ListerCours();
                nomCoursComboBox.DisplayMember = "Nom"; //Nom de la colonne dans la classe et non celui de la BD (TblCours)
                nomCoursComboBox.ValueMember = "NoCours";
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            nomCoursComboBox.SelectedIndex = -1; //ComboBox avec aucun choix sélectionne au départ
            nomCoursComboBox.DropDownStyle = ComboBoxStyle.DropDownList; //Empêche d'écrire dans le comboBox
        }
        private bool TextBoxSontRemplis()
        {
            return (noCoursTextBox.Text != "" && nomCoursTextBox.Text != "" && ponderationTextBox.Text != "");
        }

        private TblCour PrendreValeursTxtBox()
        {
            TblCour cours = new TblCour();
            cours.NoCours = noCoursTextBox.Text;
            cours.NomCours = nomCoursTextBox.Text;
            cours.Pond = ponderationTextBox.Text;
            return cours;
        }
        private void ViderTxtBox()
        {
            nomCoursComboBox.SelectedIndex = -1;
            noCoursTextBox.Clear();
            nomCoursTextBox.Clear();
            ponderationTextBox.Clear();
        }

        private void modifierDetruireCoursForm_Load(object sender, EventArgs e)
        {
            RemplirComboBox();
        }

        private void nomCoursComboBox_SelectionChangeCommitted(object sender, EventArgs e)
        {
            TblCour cours = (TblCour)nomCoursComboBox.SelectedItem; //SelectedItem est réutiliser pour les Attach

            if (cours != null)
            {
                nomCoursTextBox.Text = cours.NomCours;
                noCoursTextBox.Text = cours.NoCours;
                ponderationTextBox.Text = cours.Pond;
            }
            else
            {
                nomCoursComboBox.SelectedValue = "";
            }
        }

        private void modifierButton_Click(object sender, EventArgs e)
        {

            try
            {
                ManagerCours managerCours = new ManagerCours();
                TblCour cours;
                int nombreDeLigneAffectee = 0;

                if (TextBoxSontRemplis())
                {
                    cours = PrendreValeursTxtBox();
                    nombreDeLigneAffectee = managerCours.ModifierCours(cours);

                    if (nombreDeLigneAffectee > 0)
                    {
                        ViderTxtBox();
                        MessageBox.Show(cours.NomCours + " à été modifié avec succès!");
                        RemplirComboBox();
                    }
                    else
                    {
                        MessageBox.Show("Entrez toutes les données demandées.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            noCoursTextBox.Enabled = false; //Le numéro de cours ne peux pas être modifier, puisque c'est la clé
        }

        private void detruireButton_Click(object sender, EventArgs e)
        {
            try
            {
                ManagerCours managerCours = new ManagerCours();
                TblCour cours;
                int nombreDeLigneAffectee = 0;

                if (TextBoxSontRemplis())
                {
                    cours = PrendreValeursTxtBox();
                    nombreDeLigneAffectee = managerCours.DetruireCours(cours);

                    if (nombreDeLigneAffectee > 0)
                    {
                        ViderTxtBox();
                        MessageBox.Show(cours.NomCours + " à été détruit avec succès!");
                        RemplirComboBox();
                    }
                    else
                    {
                        MessageBox.Show("Entrez toutes les données demandées.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            //noCoursTextBox.Enabled = false; //Le numéro de cours ne peux pas être modifier, puisque c'est la clé
        }

        //////////////////////////////////////////////////////////////////////////////////////
        /// BOUTON MODIFIER ET DÉTRUIRE AVEC ATTACH
        //////////////////////////////////////////////////////////////////////////////////////

        private void btnModifAvecAttach_Click(object sender, EventArgs e)
        {
            try
            {
                ManagerCours managerCours = new ManagerCours();
                TblCour coursModifier;
                int nombreDeLigneAffectee = 0;

                if (TextBoxSontRemplis())
                {
                    TblCour coursNonModifier = (TblCour)nomCoursComboBox.SelectedItem;
                    coursModifier = PrendreValeursTxtBox();                 
                    nombreDeLigneAffectee = managerCours.ModifierCoursAvecAttach(coursModifier, coursNonModifier);

                    if (nombreDeLigneAffectee > 0)
                    {
                        ViderTxtBox();
                        MessageBox.Show(coursModifier.NomCours + " à été modifié avec succès!");
                        RemplirComboBox();
                    }
                    else
                    {
                        MessageBox.Show("Entrez toutes les données demandées.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
            noCoursTextBox.Enabled = false; //Le numéro de cours ne peux pas être modifier, puisque c'est la clé
        }

        private void btnDetrAvecAttach_Click(object sender, EventArgs e)
        {
            try
            {
                ManagerCours managerCours = new ManagerCours();
                TblCour cours;
                int nombreDeLigneAffectee = 0;

                if (TextBoxSontRemplis())
                {
                    TblCour coursDetruit = (TblCour)nomCoursComboBox.SelectedItem;
                    coursDetruit = PrendreValeursTxtBox();
                    nombreDeLigneAffectee = managerCours.DetruireCoursAvecAttach(coursDetruit);

                    if (nombreDeLigneAffectee > 0)
                    {
                        ViderTxtBox();
                        MessageBox.Show(coursDetruit.NomCours + " à été détruit avec succès!");
                        RemplirComboBox();
                    }
                    else
                    {
                        MessageBox.Show("Entrez toutes les données demandées.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur!");
            }
        }
    }
}
