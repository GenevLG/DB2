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
    public partial class vueForm : Form
    {
        ManagerOffreCours managerOffreCours = new ManagerOffreCours();
        ManagerInscription managerInscription = new ManagerInscription();   
        List<TblCour> listCoursEager;
        TblCour coursRecherche;
        public vueForm()
        {
            InitializeComponent();
        }

        private void vueForm_Load(object sender, EventArgs e)
        {
            RemplirComboBoxNomCours();
        }

        private void RemplirComboBoxNomCours()
        {
            ManagerCours managerCours = new ManagerCours();
            listCoursEager = managerCours.ListerCoursEager();
            nomCoursComboBox.DataSource = listCoursEager;
            nomCoursComboBox.ValueMember = "NoCours";
            nomCoursComboBox.DisplayMember = "nom";
        }

        private void nomCoursComboBox_SelectionChangeCommitted(object sender, EventArgs e)
        {
            coursRecherche = listCoursEager.FirstOrDefault(c => c.NoCours == nomCoursComboBox.SelectedValue);
            sessionComboBox.DataSource = coursRecherche.TblOffreCours.ToList();
            sessionComboBox.ValueMember = "NoSession";
            sessionComboBox.DisplayMember = "NoSession";
        }

        private void sessionComboBox_SelectionChangeCommitted(object sender, EventArgs e)
        {
            string sessionChoisi = sessionComboBox.SelectedValue.ToString();
            string noCoursChoisi = nomCoursComboBox.SelectedValue.ToString();
            int noOffreCours = coursRecherche.TblOffreCours
                .Where(c => c.NoCours == noCoursChoisi && c.NoSession == sessionChoisi)
                .FirstOrDefault().NoOffreCours;

            etudiantDataGridView.DataSource = managerOffreCours.ListerResultat(noOffreCours);
            etudiantDataGridView.Columns["NoOffreCours"].Visible = false;
        }

        private void etudiantDataGridView_CellEndEdit(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int nombreDeLigneAffectee = managerInscription.EnregistrerChangementNote();
                if (nombreDeLigneAffectee > 0)
                {
                    MessageBox.Show("Modifier avec succes!");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
