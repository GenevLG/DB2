﻿namespace wfa_scolaireDepart
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
            rechercherGroupBox.Location = new Point(80, 21);
            rechercherGroupBox.Margin = new Padding(3, 2, 3, 2);
            rechercherGroupBox.Name = "rechercherGroupBox";
            rechercherGroupBox.Padding = new Padding(3, 2, 3, 2);
            rechercherGroupBox.Size = new Size(487, 84);
            rechercherGroupBox.TabIndex = 16;
            rechercherGroupBox.TabStop = false;
            rechercherGroupBox.Text = "Rechercher un cours";
            // 
            // nomCoursComboBox
            // 
            nomCoursComboBox.Font = new Font("Segoe UI", 12F);
            nomCoursComboBox.FormattingEnabled = true;
            nomCoursComboBox.Location = new Point(204, 28);
            nomCoursComboBox.Margin = new Padding(3, 2, 3, 2);
            nomCoursComboBox.Name = "nomCoursComboBox";
            nomCoursComboBox.Size = new Size(217, 29);
            nomCoursComboBox.TabIndex = 6;
            nomCoursComboBox.SelectionChangeCommitted += nomCoursComboBox_SelectionChangeCommitted;
            // 
            // nomCoursRechercheLabel
            // 
            nomCoursRechercheLabel.AutoSize = true;
            nomCoursRechercheLabel.Font = new Font("Segoe UI", 12F);
            nomCoursRechercheLabel.Location = new Point(38, 30);
            nomCoursRechercheLabel.Name = "nomCoursRechercheLabel";
            nomCoursRechercheLabel.Size = new Size(109, 21);
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
            CoursGroupBox.Location = new Point(80, 133);
            CoursGroupBox.Margin = new Padding(3, 2, 3, 2);
            CoursGroupBox.Name = "CoursGroupBox";
            CoursGroupBox.Padding = new Padding(3, 2, 3, 2);
            CoursGroupBox.Size = new Size(476, 247);
            CoursGroupBox.TabIndex = 15;
            CoursGroupBox.TabStop = false;
            CoursGroupBox.Text = "Faites votre modification";
            // 
            // detruireButton
            // 
            detruireButton.Font = new Font("Segoe UI", 12F);
            detruireButton.Location = new Point(288, 171);
            detruireButton.Margin = new Padding(3, 2, 3, 2);
            detruireButton.Name = "detruireButton";
            detruireButton.Size = new Size(132, 41);
            detruireButton.TabIndex = 8;
            detruireButton.Text = "Détruire";
            detruireButton.UseVisualStyleBackColor = true;
            detruireButton.Click += detruireButton_Click;
            // 
            // modifierButton
            // 
            modifierButton.Font = new Font("Segoe UI", 12F);
            modifierButton.Location = new Point(48, 171);
            modifierButton.Margin = new Padding(3, 2, 3, 2);
            modifierButton.Name = "modifierButton";
            modifierButton.Size = new Size(132, 41);
            modifierButton.TabIndex = 7;
            modifierButton.Text = "Modifier";
            modifierButton.UseVisualStyleBackColor = true;
            modifierButton.Click += modifierButton_Click;
            // 
            // ponderationLabel
            // 
            ponderationLabel.AutoSize = true;
            ponderationLabel.Font = new Font("Segoe UI", 12F);
            ponderationLabel.Location = new Point(38, 114);
            ponderationLabel.Name = "ponderationLabel";
            ponderationLabel.Size = new Size(94, 21);
            ponderationLabel.TabIndex = 6;
            ponderationLabel.Text = "Pondération";
            // 
            // ponderationTextBox
            // 
            ponderationTextBox.Font = new Font("Segoe UI", 12F);
            ponderationTextBox.Location = new Point(204, 116);
            ponderationTextBox.Margin = new Padding(3, 2, 3, 2);
            ponderationTextBox.Name = "ponderationTextBox";
            ponderationTextBox.Size = new Size(217, 29);
            ponderationTextBox.TabIndex = 5;
            // 
            // nomCoursLlabel
            // 
            nomCoursLlabel.AutoSize = true;
            nomCoursLlabel.Font = new Font("Segoe UI", 12F);
            nomCoursLlabel.Location = new Point(38, 67);
            nomCoursLlabel.Name = "nomCoursLlabel";
            nomCoursLlabel.Size = new Size(109, 21);
            nomCoursLlabel.TabIndex = 4;
            nomCoursLlabel.Text = "Nom du cours";
            // 
            // nomCoursTextBox
            // 
            nomCoursTextBox.Font = new Font("Segoe UI", 12F);
            nomCoursTextBox.Location = new Point(204, 68);
            nomCoursTextBox.Margin = new Padding(3, 2, 3, 2);
            nomCoursTextBox.Name = "nomCoursTextBox";
            nomCoursTextBox.Size = new Size(217, 29);
            nomCoursTextBox.TabIndex = 3;
            // 
            // noCoursLabel
            // 
            noCoursLabel.AutoSize = true;
            noCoursLabel.Font = new Font("Segoe UI", 12F);
            noCoursLabel.Location = new Point(38, 21);
            noCoursLabel.Name = "noCoursLabel";
            noCoursLabel.Size = new Size(131, 21);
            noCoursLabel.TabIndex = 2;
            noCoursLabel.Text = "Numéro de cours";
            // 
            // noCoursTextBox
            // 
            noCoursTextBox.Font = new Font("Segoe UI", 12F);
            noCoursTextBox.Location = new Point(204, 22);
            noCoursTextBox.Margin = new Padding(3, 2, 3, 2);
            noCoursTextBox.Name = "noCoursTextBox";
            noCoursTextBox.Size = new Size(217, 29);
            noCoursTextBox.TabIndex = 1;
            // 
            // modifierDetruireCoursForm
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(637, 446);
            Controls.Add(rechercherGroupBox);
            Controls.Add(CoursGroupBox);
            Margin = new Padding(3, 2, 3, 2);
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