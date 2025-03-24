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
            menuStrip1.SuspendLayout();
            SuspendLayout();
            // 
            // menuStrip1
            // 
            menuStrip1.Font = new Font("Corbel", 13.8F, FontStyle.Regular, GraphicsUnit.Point, 0);
            menuStrip1.ImageScalingSize = new Size(20, 20);
            menuStrip1.Items.AddRange(new ToolStripItem[] { coursToolStripMenuItem });
            menuStrip1.Location = new Point(0, 0);
            menuStrip1.Name = "menuStrip1";
            menuStrip1.Padding = new Padding(5, 2, 0, 2);
            menuStrip1.Size = new Size(561, 31);
            menuStrip1.TabIndex = 0;
            menuStrip1.Text = "menuStrip1";
            // 
            // coursToolStripMenuItem
            // 
            coursToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { ajouterUnCoursToolStripMenuItem, modifierdétruireUnCoursToolStripMenuItem });
            coursToolStripMenuItem.Name = "coursToolStripMenuItem";
            coursToolStripMenuItem.Size = new Size(67, 27);
            coursToolStripMenuItem.Text = "Cours";
            // 
            // ajouterUnCoursToolStripMenuItem
            // 
            ajouterUnCoursToolStripMenuItem.Name = "ajouterUnCoursToolStripMenuItem";
            ajouterUnCoursToolStripMenuItem.Size = new Size(281, 28);
            ajouterUnCoursToolStripMenuItem.Text = "Ajouter un cours";
            ajouterUnCoursToolStripMenuItem.Click += ajouterUnCoursToolStripMenuItem_Click;
            // 
            // modifierdétruireUnCoursToolStripMenuItem
            // 
            modifierdétruireUnCoursToolStripMenuItem.Name = "modifierdétruireUnCoursToolStripMenuItem";
            modifierdétruireUnCoursToolStripMenuItem.Size = new Size(281, 28);
            modifierdétruireUnCoursToolStripMenuItem.Text = "Modifier/détruire un cours";
            modifierdétruireUnCoursToolStripMenuItem.Click += modifierdétruireUnCoursToolStripMenuItem_Click;
            // 
            // menuForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(561, 157);
            Controls.Add(menuStrip1);
            MainMenuStrip = menuStrip1;
            Margin = new Padding(3, 2, 3, 2);
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
    }
}