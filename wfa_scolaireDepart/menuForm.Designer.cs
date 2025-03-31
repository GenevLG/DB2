namespace wfa_scolaireDepart
{
    partial class menuForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            menuStrip1 = new MenuStrip();
            coursToolStripMenuItem = new ToolStripMenuItem();
            ajouterUnCoursToolStripMenuItem = new ToolStripMenuItem();
            modifierdétruireUnCoursToolStripMenuItem = new ToolStripMenuItem();
            résultatToolStripMenuItem = new ToolStripMenuItem();
            résultatDunÉtudiantToolStripMenuItem = new ToolStripMenuItem();
            menuStrip1.SuspendLayout();
            SuspendLayout();
            // 
            // menuStrip1
            // 
            menuStrip1.BackColor = Color.Snow;
            menuStrip1.Font = new Font("Corbel", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            menuStrip1.ImageScalingSize = new Size(20, 20);
            menuStrip1.Items.AddRange(new ToolStripItem[] { coursToolStripMenuItem, résultatToolStripMenuItem });
            menuStrip1.Location = new Point(0, 0);
            menuStrip1.Name = "menuStrip1";
            menuStrip1.Padding = new Padding(9, 4, 0, 4);
            menuStrip1.Size = new Size(729, 54);
            menuStrip1.TabIndex = 0;
            menuStrip1.Text = "menuStrip1";
            // 
            // coursToolStripMenuItem
            // 
            coursToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { ajouterUnCoursToolStripMenuItem, modifierdétruireUnCoursToolStripMenuItem });
            coursToolStripMenuItem.Font = new Font("Yu Gothic", 15.75F, FontStyle.Regular, GraphicsUnit.Point, 0);
            coursToolStripMenuItem.ForeColor = Color.FromArgb(128, 64, 0);
            coursToolStripMenuItem.Name = "coursToolStripMenuItem";
            coursToolStripMenuItem.Size = new Size(121, 46);
            coursToolStripMenuItem.Text = "Cours";
            // 
            // ajouterUnCoursToolStripMenuItem
            // 
            ajouterUnCoursToolStripMenuItem.ForeColor = Color.FromArgb(128, 64, 0);
            ajouterUnCoursToolStripMenuItem.Name = "ajouterUnCoursToolStripMenuItem";
            ajouterUnCoursToolStripMenuItem.Size = new Size(519, 50);
            ajouterUnCoursToolStripMenuItem.Text = "Ajouter un cours";
            ajouterUnCoursToolStripMenuItem.Click += ajouterUnCoursToolStripMenuItem_Click;
            // 
            // modifierdétruireUnCoursToolStripMenuItem
            // 
            modifierdétruireUnCoursToolStripMenuItem.ForeColor = Color.FromArgb(128, 64, 0);
            modifierdétruireUnCoursToolStripMenuItem.Name = "modifierdétruireUnCoursToolStripMenuItem";
            modifierdétruireUnCoursToolStripMenuItem.Size = new Size(519, 50);
            modifierdétruireUnCoursToolStripMenuItem.Text = "Modifier/détruire un cours";
            modifierdétruireUnCoursToolStripMenuItem.Click += modifierdétruireUnCoursToolStripMenuItem_Click;
            // 
            // résultatToolStripMenuItem
            // 
            résultatToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { résultatDunÉtudiantToolStripMenuItem });
            résultatToolStripMenuItem.Font = new Font("Yu Gothic", 15.75F);
            résultatToolStripMenuItem.ForeColor = Color.FromArgb(128, 64, 0);
            résultatToolStripMenuItem.Name = "résultatToolStripMenuItem";
            résultatToolStripMenuItem.Size = new Size(156, 46);
            résultatToolStripMenuItem.Text = "Résultat";
            // 
            // résultatDunÉtudiantToolStripMenuItem
            // 
            résultatDunÉtudiantToolStripMenuItem.ForeColor = Color.FromArgb(128, 64, 0);
            résultatDunÉtudiantToolStripMenuItem.Name = "résultatDunÉtudiantToolStripMenuItem";
            résultatDunÉtudiantToolStripMenuItem.Size = new Size(453, 50);
            résultatDunÉtudiantToolStripMenuItem.Text = "Résultat d'un étudiant";
            résultatDunÉtudiantToolStripMenuItem.Click += résultatDunÉtudiantToolStripMenuItem_Click;
            // 
            // menuForm
            // 
            AutoScaleDimensions = new SizeF(19F, 42F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.MistyRose;
            ClientSize = new Size(729, 121);
            Controls.Add(menuStrip1);
            Font = new Font("Yu Gothic", 15.75F);
            MainMenuStrip = menuStrip1;
            Margin = new Padding(5, 4, 5, 4);
            Name = "menuForm";
            Text = "Menu";
            menuStrip1.ResumeLayout(false);
            menuStrip1.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private MenuStrip menuStrip1;
        private ToolStripMenuItem coursToolStripMenuItem;
        private ToolStripMenuItem ajouterUnCoursToolStripMenuItem;
        private ToolStripMenuItem modifierdétruireUnCoursToolStripMenuItem;
        private ToolStripMenuItem résultatToolStripMenuItem;
        private ToolStripMenuItem résultatDunÉtudiantToolStripMenuItem;
    }
}