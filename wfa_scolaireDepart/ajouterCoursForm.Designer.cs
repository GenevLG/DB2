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
            ponderationLabel.Font = new Font("Yu Gothic", 12.75F);
            ponderationLabel.ForeColor = Color.FromArgb(128, 64, 0);
            ponderationLabel.Location = new Point(54, 208);
            ponderationLabel.Margin = new Padding(4, 0, 4, 0);
            ponderationLabel.Name = "ponderationLabel";
            ponderationLabel.Size = new Size(149, 35);
            ponderationLabel.TabIndex = 34;
            ponderationLabel.Text = "Pondération";
            // 
            // ponderationTextBox
            // 
            ponderationTextBox.Font = new Font("Segoe UI", 12F);
            ponderationTextBox.Location = new Point(291, 208);
            ponderationTextBox.Margin = new Padding(4, 2, 4, 2);
            ponderationTextBox.Name = "ponderationTextBox";
            ponderationTextBox.Size = new Size(308, 39);
            ponderationTextBox.TabIndex = 33;
            // 
            // nomCoursLlabel
            // 
            nomCoursLlabel.AutoSize = true;
            nomCoursLlabel.Font = new Font("Yu Gothic", 12.75F);
            nomCoursLlabel.ForeColor = Color.FromArgb(128, 64, 0);
            nomCoursLlabel.Location = new Point(54, 128);
            nomCoursLlabel.Margin = new Padding(4, 0, 4, 0);
            nomCoursLlabel.Name = "nomCoursLlabel";
            nomCoursLlabel.Size = new Size(180, 34);
            nomCoursLlabel.TabIndex = 32;
            nomCoursLlabel.Text = "Nom du cours";
            // 
            // nomCoursTextBox
            // 
            nomCoursTextBox.Font = new Font("Segoe UI", 12F);
            nomCoursTextBox.Location = new Point(291, 128);
            nomCoursTextBox.Margin = new Padding(4, 2, 4, 2);
            nomCoursTextBox.Name = "nomCoursTextBox";
            nomCoursTextBox.Size = new Size(308, 39);
            nomCoursTextBox.TabIndex = 31;
            // 
            // noCoursLabel
            // 
            noCoursLabel.AutoSize = true;
            noCoursLabel.Font = new Font("Yu Gothic", 12.75F);
            noCoursLabel.ForeColor = Color.FromArgb(128, 64, 0);
            noCoursLabel.Location = new Point(54, 52);
            noCoursLabel.Margin = new Padding(4, 0, 4, 0);
            noCoursLabel.Name = "noCoursLabel";
            noCoursLabel.Size = new Size(219, 34);
            noCoursLabel.TabIndex = 30;
            noCoursLabel.Text = "Numéro de cours";
            // 
            // noCoursTextBox
            // 
            noCoursTextBox.Font = new Font("Segoe UI", 12F);
            noCoursTextBox.Location = new Point(291, 52);
            noCoursTextBox.Margin = new Padding(4, 2, 4, 2);
            noCoursTextBox.Name = "noCoursTextBox";
            noCoursTextBox.Size = new Size(308, 39);
            noCoursTextBox.TabIndex = 29;
            // 
            // ajouterButton
            // 
            ajouterButton.BackColor = Color.Snow;
            ajouterButton.Font = new Font("Yu Gothic", 12.75F);
            ajouterButton.ForeColor = Color.Black;
            ajouterButton.Location = new Point(411, 298);
            ajouterButton.Margin = new Padding(4, 2, 4, 2);
            ajouterButton.Name = "ajouterButton";
            ajouterButton.Size = new Size(189, 68);
            ajouterButton.TabIndex = 28;
            ajouterButton.Text = "Ajouter";
            ajouterButton.UseVisualStyleBackColor = false;
            ajouterButton.Click += ajouterButton_Click;
            // 
            // ajouterCoursForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.MistyRose;
            ClientSize = new Size(699, 443);
            Controls.Add(ponderationLabel);
            Controls.Add(ponderationTextBox);
            Controls.Add(nomCoursLlabel);
            Controls.Add(nomCoursTextBox);
            Controls.Add(noCoursLabel);
            Controls.Add(noCoursTextBox);
            Controls.Add(ajouterButton);
            ForeColor = Color.FromArgb(128, 64, 0);
            Margin = new Padding(4, 3, 4, 3);
            Name = "ajouterCoursForm";
            Text = "Ajouter un cours";
            Load += ajouterCoursForm_Load;
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
