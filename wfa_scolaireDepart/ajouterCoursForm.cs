using wfa_scolaireDepart.Manager;
using wfa_scolaireDepart.Models;

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

        private TblCour PrendreValeursTxtBox()
        {
            TblCour cours = new TblCour();
            cours.NoCours = noCoursTextBox.Text;
            cours.Nom = nomCoursTextBox.Text;
            cours.Pond = ponderationTextBox.Text;
            return cours;
        }

        private void ViderTxtBox()
        {
            noCoursTextBox.Clear();
            nomCoursTextBox.Clear();
            ponderationTextBox.Clear();
        }

        private void ajouterButton_Click(object sender, EventArgs e)
        {
            TblCour cours = new TblCour();
            ManagerCours managerCours = new ManagerCours();
            int nombreLignesAffectees = 0;
            try
            {
                if (TextBoxSontRemplis())
                {
                    cours = PrendreValeursTxtBox(); //prendre des valeurs                   
                    nombreLignesAffectees = managerCours.AjouterCours(cours); //appeler fonction d'ajout
                    if (nombreLignesAffectees > 0)
                    {
                        ViderTxtBox();
                        MessageBox.Show(cours.Nom + " à été ajouté avec succès.");                     
                    }
                }
                else
                {
                    MessageBox.Show("Entrez toutes les données.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Erreur", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ajouterCoursForm_Load(object sender, EventArgs e)
        {
            noCoursTextBox.MaxLength = 8;
            ponderationTextBox.MaxLength = 5;
        }
    }
}
