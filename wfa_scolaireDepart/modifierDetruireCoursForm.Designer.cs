namespace wfa_scolaireDepart
{
    partial class modifierDetruireCoursForm
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
            rechercherGroupBox = new GroupBox();
            nomCoursComboBox = new ComboBox();
            nomCoursRechercheLabel = new Label();
            CoursGroupBox = new GroupBox();
            detruireButton = new Button();
            modifierButton = new Button();
            ponderationLabel = new Label();
            ponderationTextBox = new TextBox();
            nomCoursLlabel = new Label();
            nomCoursTextBox = new TextBox();
            noCoursLabel = new Label();
            noCoursTextBox = new TextBox();
            rechercherGroupBox.SuspendLayout();
            CoursGroupBox.SuspendLayout();
            SuspendLayout();
            // 
            // rechercherGroupBox
            // 
            rechercherGroupBox.Controls.Add(nomCoursComboBox);
            rechercherGroupBox.Controls.Add(nomCoursRechercheLabel);
            rechercherGroupBox.Location = new Point(26, 55);
            rechercherGroupBox.Margin = new Padding(5, 4, 5, 4);
            rechercherGroupBox.Name = "rechercherGroupBox";
            rechercherGroupBox.Padding = new Padding(5, 4, 5, 4);
            rechercherGroupBox.Size = new Size(667, 110);
            rechercherGroupBox.TabIndex = 16;
            rechercherGroupBox.TabStop = false;
            rechercherGroupBox.Text = "Rechercher un cours";
            // 
            // nomCoursComboBox
            // 
            nomCoursComboBox.Font = new Font("Segoe UI", 12F);
            nomCoursComboBox.FormattingEnabled = true;
            nomCoursComboBox.Location = new Point(263, 50);
            nomCoursComboBox.Margin = new Padding(5, 4, 5, 4);
            nomCoursComboBox.Name = "nomCoursComboBox";
            nomCoursComboBox.Size = new Size(369, 29);
            nomCoursComboBox.TabIndex = 6;
            nomCoursComboBox.SelectionChangeCommitted += nomCoursComboBox_SelectionChangeCommitted;
            // 
            // nomCoursRechercheLabel
            // 
            nomCoursRechercheLabel.AutoSize = true;
            nomCoursRechercheLabel.Font = new Font("Yu Gothic", 12.75F);
            nomCoursRechercheLabel.Location = new Point(65, 54);
            nomCoursRechercheLabel.Margin = new Padding(5, 0, 5, 0);
            nomCoursRechercheLabel.Name = "nomCoursRechercheLabel";
            nomCoursRechercheLabel.Size = new Size(122, 22);
            nomCoursRechercheLabel.TabIndex = 5;
            nomCoursRechercheLabel.Text = "Nom du cours";
            // 
            // CoursGroupBox
            // 
            CoursGroupBox.Controls.Add(detruireButton);
            CoursGroupBox.Controls.Add(modifierButton);
            CoursGroupBox.Controls.Add(ponderationLabel);
            CoursGroupBox.Controls.Add(ponderationTextBox);
            CoursGroupBox.Controls.Add(nomCoursLlabel);
            CoursGroupBox.Controls.Add(nomCoursTextBox);
            CoursGroupBox.Controls.Add(noCoursLabel);
            CoursGroupBox.Controls.Add(noCoursTextBox);
            CoursGroupBox.Location = new Point(26, 202);
            CoursGroupBox.Margin = new Padding(5, 4, 5, 4);
            CoursGroupBox.Name = "CoursGroupBox";
            CoursGroupBox.Padding = new Padding(5, 4, 5, 4);
            CoursGroupBox.Size = new Size(667, 356);
            CoursGroupBox.TabIndex = 15;
            CoursGroupBox.TabStop = false;
            CoursGroupBox.Text = "Faites votre modification";
            // 
            // detruireButton
            // 
            detruireButton.BackColor = Color.Snow;
            detruireButton.Font = new Font("Yu Gothic", 15.75F);
            detruireButton.ForeColor = Color.Black;
            detruireButton.Location = new Point(478, 287);
            detruireButton.Margin = new Padding(5, 4, 5, 4);
            detruireButton.Name = "detruireButton";
            detruireButton.Size = new Size(154, 37);
            detruireButton.TabIndex = 8;
            detruireButton.Text = "Détruire";
            detruireButton.UseVisualStyleBackColor = false;
            detruireButton.Click += detruireButton_Click;
            // 
            // modifierButton
            // 
            modifierButton.BackColor = Color.Snow;
            modifierButton.Font = new Font("Yu Gothic", 15.75F, FontStyle.Regular, GraphicsUnit.Point, 0);
            modifierButton.ForeColor = Color.Black;
            modifierButton.Location = new Point(111, 287);
            modifierButton.Margin = new Padding(5, 4, 5, 4);
            modifierButton.Name = "modifierButton";
            modifierButton.Size = new Size(154, 37);
            modifierButton.TabIndex = 7;
            modifierButton.Text = "Modifier";
            modifierButton.UseVisualStyleBackColor = false;
            modifierButton.Click += modifierButton_Click;
            // 
            // ponderationLabel
            // 
            ponderationLabel.AutoSize = true;
            ponderationLabel.Font = new Font("Yu Gothic", 12.75F);
            ponderationLabel.Location = new Point(65, 205);
            ponderationLabel.Margin = new Padding(5, 0, 5, 0);
            ponderationLabel.Name = "ponderationLabel";
            ponderationLabel.Size = new Size(105, 22);
            ponderationLabel.TabIndex = 6;
            ponderationLabel.Text = "Pondération";
            // 
            // ponderationTextBox
            // 
            ponderationTextBox.Font = new Font("Segoe UI", 12F);
            ponderationTextBox.Location = new Point(263, 209);
            ponderationTextBox.Margin = new Padding(5, 4, 5, 4);
            ponderationTextBox.Name = "ponderationTextBox";
            ponderationTextBox.Size = new Size(369, 29);
            ponderationTextBox.TabIndex = 5;
            // 
            // nomCoursLlabel
            // 
            nomCoursLlabel.AutoSize = true;
            nomCoursLlabel.Font = new Font("Yu Gothic", 12.75F);
            nomCoursLlabel.Location = new Point(65, 121);
            nomCoursLlabel.Margin = new Padding(5, 0, 5, 0);
            nomCoursLlabel.Name = "nomCoursLlabel";
            nomCoursLlabel.Size = new Size(122, 22);
            nomCoursLlabel.TabIndex = 4;
            nomCoursLlabel.Text = "Nom du cours";
            // 
            // nomCoursTextBox
            // 
            nomCoursTextBox.Font = new Font("Segoe UI", 12F);
            nomCoursTextBox.Location = new Point(263, 122);
            nomCoursTextBox.Margin = new Padding(5, 4, 5, 4);
            nomCoursTextBox.Name = "nomCoursTextBox";
            nomCoursTextBox.Size = new Size(369, 29);
            nomCoursTextBox.TabIndex = 3;
            // 
            // noCoursLabel
            // 
            noCoursLabel.AutoSize = true;
            noCoursLabel.Font = new Font("Yu Gothic", 12.75F);
            noCoursLabel.Location = new Point(65, 38);
            noCoursLabel.Margin = new Padding(5, 0, 5, 0);
            noCoursLabel.Name = "noCoursLabel";
            noCoursLabel.Size = new Size(146, 22);
            noCoursLabel.TabIndex = 2;
            noCoursLabel.Text = "Numéro de cours";
            // 
            // noCoursTextBox
            // 
            noCoursTextBox.Font = new Font("Segoe UI", 12F);
            noCoursTextBox.Location = new Point(263, 40);
            noCoursTextBox.Margin = new Padding(5, 4, 5, 4);
            noCoursTextBox.Name = "noCoursTextBox";
            noCoursTextBox.Size = new Size(369, 29);
            noCoursTextBox.TabIndex = 1;
            // 
            // modifierDetruireCoursForm
            // 
            AutoScaleDimensions = new SizeF(12F, 27F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.MistyRose;
            ClientSize = new Size(718, 582);
            Controls.Add(rechercherGroupBox);
            Controls.Add(CoursGroupBox);
            Font = new Font("Yu Gothic", 15.75F);
            ForeColor = Color.FromArgb(128, 64, 0);
            Margin = new Padding(5, 4, 5, 4);
            Name = "modifierDetruireCoursForm";
            Text = "Modifier un cours";
            Load += modifierDetruireCoursForm_Load;
            rechercherGroupBox.ResumeLayout(false);
            rechercherGroupBox.PerformLayout();
            CoursGroupBox.ResumeLayout(false);
            CoursGroupBox.PerformLayout();
            ResumeLayout(false);
        }

        #endregion
        private GroupBox rechercherGroupBox;
        private ComboBox nomCoursComboBox;
        private Label nomCoursRechercheLabel;
        private GroupBox CoursGroupBox;
        private Button detruireButton;
        private Button modifierButton;
        private Label ponderationLabel;
        private TextBox ponderationTextBox;
        private Label nomCoursLlabel;
        private TextBox nomCoursTextBox;
        private Label noCoursLabel;
        private TextBox noCoursTextBox;
    }
}