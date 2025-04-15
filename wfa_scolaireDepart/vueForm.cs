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
        ManagerCours managerCours;
        List<TblCour> listecours;
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
            listecours = managerCours.ListerCoursEager();
            nomCoursComboBox.DataSource = listecours;
            nomCoursComboBox.ValueMember = "no_Cours";
            nomCoursComboBox.DisplayMember = "nom";
        }
    }
}
