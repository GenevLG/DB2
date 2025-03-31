namespace wfa_scolaireDepart
{
    partial class scannerForm
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
            noDATextBox = new TextBox();
            noDA = new Label();
            listButton = new Button();
            resultatDataGridView = new DataGridView();
            storedProcedureButton = new Button();
            storedProcedureOutputButton = new Button();
            Session = new Label();
            sessionTextBox = new TextBox();
            ((System.ComponentModel.ISupportInitialize)resultatDataGridView).BeginInit();
            SuspendLayout();
            // 
            // noDATextBox
            // 
            noDATextBox.Location = new Point(284, 33);
            noDATextBox.Name = "noDATextBox";
            noDATextBox.Size = new Size(288, 31);
            noDATextBox.TabIndex = 0;
            // 
            // noDA
            // 
            noDA.AutoSize = true;
            noDA.Font = new Font("Yu Gothic", 12.75F);
            noDA.ForeColor = Color.FromArgb(128, 64, 0);
            noDA.Location = new Point(43, 33);
            noDA.Margin = new Padding(4, 0, 4, 0);
            noDA.Name = "noDA";
            noDA.Size = new Size(204, 34);
            noDA.TabIndex = 31;
            noDA.Text = "Numéro de DA :";
            // 
            // listButton
            // 
            listButton.BackColor = Color.Snow;
            listButton.Font = new Font("Yu Gothic", 12.75F);
            listButton.ForeColor = Color.Black;
            listButton.Location = new Point(615, 30);
            listButton.Margin = new Padding(4, 2, 4, 2);
            listButton.Name = "listButton";
            listButton.Size = new Size(285, 40);
            listButton.TabIndex = 32;
            listButton.Text = "Lister";
            listButton.UseVisualStyleBackColor = false;
            listButton.Click += listButton_Click;
            // 
            // resultatDataGridView
            // 
            resultatDataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            resultatDataGridView.Location = new Point(43, 94);
            resultatDataGridView.Name = "resultatDataGridView";
            resultatDataGridView.RowHeadersWidth = 62;
            resultatDataGridView.Size = new Size(857, 285);
            resultatDataGridView.TabIndex = 33;
            // 
            // storedProcedureButton
            // 
            storedProcedureButton.BackColor = Color.Snow;
            storedProcedureButton.Font = new Font("Yu Gothic", 15.75F, FontStyle.Regular, GraphicsUnit.Point, 0);
            storedProcedureButton.ForeColor = Color.Black;
            storedProcedureButton.Location = new Point(43, 535);
            storedProcedureButton.Margin = new Padding(5, 4, 5, 4);
            storedProcedureButton.Name = "storedProcedureButton";
            storedProcedureButton.Size = new Size(470, 47);
            storedProcedureButton.TabIndex = 34;
            storedProcedureButton.Text = "Nombre de cours par session";
            storedProcedureButton.UseVisualStyleBackColor = false;
            storedProcedureButton.Click += storedProcedureButton_Click;
            // 
            // storedProcedureOutputButton
            // 
            storedProcedureOutputButton.BackColor = Color.Snow;
            storedProcedureOutputButton.Font = new Font("Yu Gothic", 15.75F, FontStyle.Regular, GraphicsUnit.Point, 0);
            storedProcedureOutputButton.ForeColor = Color.Black;
            storedProcedureOutputButton.Location = new Point(43, 607);
            storedProcedureOutputButton.Margin = new Padding(5, 4, 5, 4);
            storedProcedureOutputButton.Name = "storedProcedureOutputButton";
            storedProcedureOutputButton.Size = new Size(470, 97);
            storedProcedureOutputButton.TabIndex = 35;
            storedProcedureOutputButton.Text = "Nombre de cours par session \r\n(output)";
            storedProcedureOutputButton.UseVisualStyleBackColor = false;
            storedProcedureOutputButton.Click += storedProcedureOutputButton_Click;
            // 
            // Session
            // 
            Session.AutoSize = true;
            Session.Font = new Font("Yu Gothic", 12.75F);
            Session.ForeColor = Color.FromArgb(128, 64, 0);
            Session.Location = new Point(43, 470);
            Session.Margin = new Padding(4, 0, 4, 0);
            Session.Name = "Session";
            Session.Size = new Size(123, 34);
            Session.TabIndex = 37;
            Session.Text = "Session :";
            // 
            // sessionTextBox
            // 
            sessionTextBox.Location = new Point(209, 470);
            sessionTextBox.Name = "sessionTextBox";
            sessionTextBox.Size = new Size(304, 31);
            sessionTextBox.TabIndex = 36;
            // 
            // scannerForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.MistyRose;
            ClientSize = new Size(949, 764);
            Controls.Add(Session);
            Controls.Add(sessionTextBox);
            Controls.Add(storedProcedureOutputButton);
            Controls.Add(storedProcedureButton);
            Controls.Add(resultatDataGridView);
            Controls.Add(listButton);
            Controls.Add(noDA);
            Controls.Add(noDATextBox);
            Name = "scannerForm";
            Text = "scannerForm";
            Load += scannerForm_Load;
            ((System.ComponentModel.ISupportInitialize)resultatDataGridView).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox noDATextBox;
        private Label noDA;
        private Button listButton;
        private DataGridView resultatDataGridView;
        private Button storedProcedureButton;
        private Button storedProcedureOutputButton;
        private Label Session;
        private TextBox sessionTextBox;
    }
}