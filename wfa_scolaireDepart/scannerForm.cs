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

namespace wfa_scolaireDepart
{
    public partial class scannerForm : Form
    {
        public scannerForm()
        {
            InitializeComponent();
        }

        private async void listButton_Click(object sender, EventArgs e)
        {
            ManagerInscription managerInscription = new ManagerInscription();

            var liste = await managerInscription.ListerResultat(noDATextBox.Text);
            resultatDataGridView.DataSource = liste;
        }

        private void scannerForm_Load(object sender, EventArgs e)
        {

        }

        private void storedProcedureButton_Click(object sender, EventArgs e)
        {

        }

        private async void storedProcedureOutputButton_Click(object sender, EventArgs e)
        {
            ManagerOffreCours managerOffreCours = new ManagerOffreCours();

            var nombreDeCours = await managerOffreCours.GetCoursBySessionWithOutput(sessionTextBox.Text);
            MessageBox.Show("Le nombre de cours de la session " + sessionTextBox.ToString + " est de : " + nombreDeCours);
        }
    }
}
