package com.example.onlinetutors.service;

import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    @Value("${spring.sendgrid.from-email}")
    private String from;

    private final SendGrid sendGrid;

    public void sendEmail(String to, String subject, String body) {
        log.info("Sending email to: {}", to);
        log.info("Subject: {}", subject);
        log.info("Body: {}", body);

        Email fromEmail = new Email(from);
        Email toEmail = new Email(to);

        Content content = new Content("text/plain", body);
        Mail mail = new Mail(fromEmail, subject, toEmail, content);

        Request request = new Request();
        try {
            request.setMethod(com.sendgrid.Method.POST);
            request.setEndpoint("mail/send");
            request.setBody(mail.build());

            Response response = sendGrid.api(request);
            if (response.getStatusCode() == 202) {
                log.info("Email sent successfully to: {}", to);
            } else {
                log.error("Failed to send email. Status Code: {}, Body: {}", response.getStatusCode(), response.getBody());
            }
        } catch (Exception ex) {
            log.error("Error sending email: {}", ex.getMessage());
        }


    }
}
