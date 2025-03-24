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

        private void modifierDetruireCoursForm_Load(object sender, EventArgs e)
        {
            RemplirComboBox();
        }

        private void nomCoursComboBox_SelectionChangeCommitted(object sender, EventArgs e)
        {
            TblCour cours = (TblCour)nomCoursComboBox.SelectedItem;

            if (cours != null)
            {
                nomCoursTextBox.Text = cours.Nom;
                noCoursTextBox.Text = cours.NoCours;
                ponderationTextBox.Text = cours.Pond;
            }
            else 
            { 
            nomCoursComboBox.SelectedValue = "";
            }
        }
    }
}
