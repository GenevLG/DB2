namespace wfa_scolaireDepart
{
    partial class ajouterCoursForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            ponderationLabel = new Label();
            ponderationTextBox = new TextBox();
            nomCoursLlabel = new Label();
            nomCoursTextBox = new TextBox();
            noCoursLabel = new Label();
            noCoursTextBox = new TextBox();
            ajouterButton = new Button();
            SuspendLayout();
            // 
            // ponderationLabel
            // 
            ponderationLabel.Font = new Font("Segoe UI", 12F);
            ponderationLabel.Location = new Point(43, 167);
            ponderationLabel.Name = "ponderationLabel";
            ponderationLabel.Size = new Size(119, 28);
            ponderationLabel.TabIndex = 34;
            ponderationLabel.Text = "Pondération";
            // 
            // ponderationTextBox
            // 
            ponderationTextBox.Font = new Font("Segoe UI", 12F);
            ponderationTextBox.Location = new Point(233, 167);
            ponderationTextBox.Margin = new Padding(3, 2, 3, 2);
            ponderationTextBox.Name = "ponderationTextBox";
            ponderationTextBox.Size = new Size(247, 34);
            ponderationTextBox.TabIndex = 33;
            // 
            // nomCoursLlabel
            // 
            nomCoursLlabel.AutoSize = true;
            nomCoursLlabel.Font = new Font("Segoe UI", 12F);
            nomCoursLlabel.Location = new Point(43, 103);
            nomCoursLlabel.Name = "nomCoursLlabel";
            nomCoursLlabel.Size = new Size(136, 28);
            nomCoursLlabel.TabIndex = 32;
            nomCoursLlabel.Text = "Nom du cours";
            // 
            // nomCoursTextBox
            // 
            nomCoursTextBox.Font = new Font("Segoe UI", 12F);
            nomCoursTextBox.Location = new Point(233, 103);
            nomCoursTextBox.Margin = new Padding(3, 2, 3, 2);
            nomCoursTextBox.Name = "nomCoursTextBox";
            nomCoursTextBox.Size = new Size(247, 34);
            nomCoursTextBox.TabIndex = 31;
            // 
            // noCoursLabel
            // 
            noCoursLabel.AutoSize = true;
            noCoursLabel.Font = new Font("Segoe UI", 12F);
            noCoursLabel.Location = new Point(43, 42);
            noCoursLabel.Name = "noCoursLabel";
            noCoursLabel.Size = new Size(163, 28);
            noCoursLabel.TabIndex = 30;
            noCoursLabel.Text = "Numéro de cours";
            // 
            // noCoursTextBox
            // 
            noCoursTextBox.Font = new Font("Segoe UI", 12F);
            noCoursTextBox.Location = new Point(233, 42);
            noCoursTextBox.Margin = new Padding(3, 2, 3, 2);
            noCoursTextBox.Name = "noCoursTextBox";
            noCoursTextBox.Size = new Size(247, 34);
            noCoursTextBox.TabIndex = 29;
            // 
            // ajouterButton
            // 
            ajouterButton.Font = new Font("Segoe UI", 12F);
            ajouterButton.Location = new Point(329, 239);
            ajouterButton.Margin = new Padding(3, 2, 3, 2);
            ajouterButton.Name = "ajouterButton";
            ajouterButton.Size = new Size(151, 55);
            ajouterButton.TabIndex = 28;
            ajouterButton.Text = "Ajouter";
            ajouterButton.UseVisualStyleBackColor = true;
            // 
            // ajouterCoursForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(558, 355);
            Controls.Add(ponderationLabel);
            Controls.Add(ponderationTextBox);
            Controls.Add(nomCoursLlabel);
            Controls.Add(nomCoursTextBox);
            Controls.Add(noCoursLabel);
            Controls.Add(noCoursTextBox);
            Controls.Add(ajouterButton);
            Name = "ajouterCoursForm";
            Text = "Ajouter un cours";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label ponderationLabel;
        private TextBox ponderationTextBox;
        private Label nomCoursLlabel;
        private TextBox nomCoursTextBox;
        private Label noCoursLabel;
        private TextBox noCoursTextBox;
        private Button ajouterButton;
    }
}
