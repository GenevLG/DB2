namespace wfa_scolaireDepart
{
    public partial class ajouterCoursForm : Form
    {
        public ajouterCoursForm()
        {
            InitializeComponent();
        }

        private bool TextBoxSontRemplis()
        {
            return (noCoursTextBox.Text != "" && nomCoursTextBox.Text != "" && ponderationTextBox.Text != "");
        }

        //private TblCour PrendreValeursTxtBox()
        //{
            
        //}

        private void ajouterButton_Click(object sender, EventArgs e)
        {
            //Cours cours = new Cours();
            //ManagerCours managerCours = new ManagerCours();
            //int nombreLignesAffectes = 0;
            //try
            //{
            //    if (TextBoxSontRemplis())
            //    {
            //        //prendre des valeurs
            //        cours = PrendreValeursTextBox();
            //        //appeler fonction d'ajout
            //        nombreLignesAffectes = managerCours.AjouterCours(cours);
            //        if (nombreLignesAffectes > 0)
            //        {
            //            MessageBox.Show("Ajout avec succès.");
            //        }
            //    }
            //    else
            //    {
            //        MessageBox.Show("Entrez toutes les données.");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
    }
}
